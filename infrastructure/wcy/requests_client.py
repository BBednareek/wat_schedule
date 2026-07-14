from typing import Any

import requests
import urllib3

from constants.constants import BASE_URL_WCY, ENCODING
from domain.exceptions import SourceFetchError
from infrastructure.wcy.html_parser import WcyGroupListParser


class RequestsWcyScheduleClient:
    def __init__(
        self,
        base_url: str = BASE_URL_WCY,
        session: requests.Session | None = None,
        timeout: int = 30,
        verify_ssl: bool = False,
    ) -> None:
        self.base_url = base_url.rstrip("/")
        self.session = session or requests.Session()
        self.timeout = timeout
        self.verify_ssl = verify_ssl
        self.group_list_parser = WcyGroupListParser()

        self.session.headers.setdefault("User-Agent", "Mozilla/5.0")

        if not self.verify_ssl:
            urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

    def fetch_group_names(self) -> list[str]:
        html = self._get(self.base_url)
        return self.group_list_parser.parse(html)

    def fetch_schedule_html(self, group_name: str) -> str:
        return self._get(
            f"{self.base_url}/rozklad",
            params={"grupa_id": group_name},
        )

    def _get(self, url: str, params: dict[str, Any] | None = None) -> str:
        try:
            response = self.session.get(
                url,
                params=params,
                timeout=self.timeout,
                verify=self.verify_ssl,
            )
            response.raise_for_status()
        except requests.exceptions.RequestException as exc:
            raise SourceFetchError(
                "Failed to fetch WCY schedule source.",
                details={
                    "url": url,
                    "params": params or {},
                    "reason": str(exc),
                },
            ) from exc

        response.encoding = response.encoding or ENCODING
        return response.text
