from bs4 import BeautifulSoup

from domain.wcy import WcyScheduleEntry as WCYScheduleEntry
from infrastructure.wcy.html_parser import WcyGroupListParser, WcyScheduleHtmlParser


class WCYGroupExtractor:
    """
    Backward-compatible facade for the WCY DOM parser.

    The real WCY implementation lives in domain, application and infrastructure.
    """

    def __init__(self, html: str | BeautifulSoup) -> None:
        self.html = html
        self.parser = WcyScheduleHtmlParser()

    @staticmethod
    def extract_group_names(html: str | BeautifulSoup) -> list[str]:
        return WcyGroupListParser().parse(html)

    def extract_schedule_entries(self) -> list[WCYScheduleEntry]:
        return self.parser.parse(self.html)
