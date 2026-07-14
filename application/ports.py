from pathlib import Path
from typing import Protocol

from domain.schedule import ScheduleData
from domain.wcy import WcyScheduleEntry


class PlansoftGroupFileSource(Protocol):
    def fetch_group_files(self) -> list[str]:
        ...

    def download_plans_async(self, group_files: list[str]) -> None:
        ...


class PlansoftHtmlToExcelConverter(Protocol):
    def html_to_excel_parallel(self) -> None:
        ...


class PlansoftScheduleFileFinder(Protocol):
    def iter_schedule_files(self) -> list[tuple[str, Path]]:
        ...


class PlansoftScheduleParser(Protocol):
    def parse_group_file(self, filepath: Path, group_name: str) -> ScheduleData:
        ...


class WcyScheduleSource(Protocol):
    def fetch_group_names(self) -> list[str]:
        ...

    def fetch_schedule_html(self, group_name: str) -> str:
        ...


class WcyScheduleParser(Protocol):
    def parse(self, html: str) -> list[WcyScheduleEntry]:
        ...


class WcyScheduleMapper(Protocol):
    def map_entries(self, entries: list[WcyScheduleEntry]) -> ScheduleData:
        ...
