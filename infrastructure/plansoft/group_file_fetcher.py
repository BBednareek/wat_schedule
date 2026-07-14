from asyncio import Semaphore, gather, run, sleep
from os import path
from random import random
from typing import Any, Coroutine

from aiofiles import open as aio_open
from bs4 import BeautifulSoup
from httpx import AsyncClient, HTTPError, TimeoutException
from requests import RequestException, Response
from requests import get as requests_get

from constants.constants import SAVE_FOLDER
from domain.exceptions import SourceFetchError


class FacultyGroupFetcher:
    """
    Downloads Plansoft group schedule files from faculty XML indexes.
    """

    def __init__(self, base_urls: list[str], faculty_prefixes: list[str]) -> None:
        self.base_urls = base_urls
        self.faculty_prefixes = faculty_prefixes
        self._download_bases: dict[str, str] = {}

    @staticmethod
    def _normalize_source_url(base_url: str) -> tuple[str, str]:
        if base_url.endswith("index.xml"):
            return base_url, base_url.rsplit("/", 1)[0]

        return f"{base_url.rstrip('/')}/index.xml", base_url.rstrip("/")

    @staticmethod
    def _join_url(base_url: str, filename: str) -> str:
        return f"{base_url.rstrip('/')}/{filename.lstrip('/')}"

    def _load_xml(self, xml_url: str) -> BeautifulSoup:
        try:
            response: Response = requests_get(xml_url, verify=False, timeout=30)
            response.raise_for_status()
        except RequestException as exc:
            raise SourceFetchError(
                "Failed to load Plansoft XML index.",
                details={
                    "xml_url": xml_url,
                    "reason": str(exc),
                },
            ) from exc

        return BeautifulSoup(response.content, "xml")

    def _extract_group_files(self, soup: BeautifulSoup) -> list[str]:
        return [
            tag["href"]
            for tag in soup.find_all("gro")
            if (href := tag.get("href"))
            and any(href.startswith(prefix) for prefix in self.faculty_prefixes)
        ]

    def fetch_group_files(self) -> list[str]:
        files: list[str] = []
        seen: set[str] = set()
        failed_sources: list[dict[str, str]] = []

        for base_url in self.base_urls:
            xml_url, download_base = self._normalize_source_url(base_url)

            try:
                soup = self._load_xml(xml_url)
            except SourceFetchError as exc:
                failed_sources.append(
                    {
                        "xml_url": xml_url,
                        "reason": str(exc),
                    }
                )
                print(f"Failed to load XML {xml_url}: {exc}")
                continue

            source_files = self._extract_group_files(soup)

            for filename in source_files:
                if filename in seen:
                    continue

                seen.add(filename)
                self._download_bases[filename] = download_base
                files.append(filename)

            print(f"Found {len(source_files)} files in {xml_url}: {source_files[:5]}...")

        print(f"Total unique files found: {len(files)}")

        if failed_sources:
            print(f"Skipped {len(failed_sources)} unavailable Plansoft XML indexes.")

        if not files:
            raise SourceFetchError(
                "No Plansoft group files found.",
                details={
                    "base_urls": self.base_urls,
                    "failed_sources": failed_sources,
                },
            )

        return files

    @staticmethod
    async def _download_file(
        filename: str,
        download_base: str,
        client: AsyncClient,
        semaphore: Semaphore,
    ) -> bool:
        url = FacultyGroupFetcher._join_url(download_base, filename)
        save_path = path.join(SAVE_FOLDER, filename)

        async with semaphore:
            for attempt in range(3):
                try:
                    response = await client.get(url, timeout=15)
                    response.raise_for_status()

                    async with aio_open(save_path, "wb") as file:
                        await file.write(response.content)

                    print(f"Saved: {filename}")
                    return True
                except (HTTPError, TimeoutException) as exc:
                    print(f"Retry {attempt + 1}/3 for {filename}: {exc}")
                    await sleep(1 + random() * 2)
                except Exception as exc:
                    print(f"Unhandled error downloading {filename}: {exc}")
                    return False

            print(f"Failed to download after 3 attempts: {filename}")
            return False

    async def _download_all(self, group_files: list[str]) -> None:
        semaphore = Semaphore(10)

        async with AsyncClient(verify=False) as client:
            tasks: list[Coroutine[Any, Any, bool]] = [
                self._download_file(
                    filename,
                    self._download_bases[filename],
                    client,
                    semaphore,
                )
                for filename in group_files
            ]
            results = await gather(*tasks)

        failed_count = len([result for result in results if not result])

        if failed_count == len(group_files) and group_files:
            raise SourceFetchError(
                "All Plansoft schedule downloads failed.",
                details={"files_requested": len(group_files)},
            )

        if failed_count:
            print(f"Plansoft downloads finished with {failed_count} failed files.")

    def download_plans_async(self, group_files: list[str]) -> None:
        print(f"Async downloading {len(group_files)} files with retry and throttling...")
        try:
            run(self._download_all(group_files))
        except SourceFetchError:
            raise
        except Exception as exc:
            raise SourceFetchError(
                "Unexpected Plansoft download failure.",
                details={"reason": str(exc)},
            ) from exc
