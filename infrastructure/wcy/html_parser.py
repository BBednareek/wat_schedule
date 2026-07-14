import re
from dataclasses import dataclass
from datetime import date, datetime
from typing import Iterable

from bs4 import BeautifulSoup, Tag

from domain.wcy import WcyRoom, WcyScheduleEntry


@dataclass(frozen=True)
class _ParsedLessonName:
    subject: str
    lesson_type: str
    rooms: tuple[WcyRoom, ...]
    ordinal: str


@dataclass(frozen=True)
class _ParsedLessonInfo:
    subject_full: str
    form: str
    teacher: str


class WcyLessonNameParser:
    HEADER_RE = re.compile(
        r"^\s*(?P<subject>[^\s(]*)?\s*(?:\((?P<type>[^)]*)\))?\s*(?P<rest>.*)$"
    )
    ORDINAL_RE = re.compile(r"\[(?P<ordinal>\d+)\]\s*$")
    ROOM_RE = re.compile(
        r"^(?P<number>\d+)\s+(?P<building>[A-Za-zĄĆĘŁŃÓŚŹŻąćęłńóśźż0-9]+)$"
    )
    AUDITORIUM_RE = re.compile(r"^(?P<building>AW)\s+(?P<number>.+)$", re.IGNORECASE)

    def parse(self, lesson_name: str, teacher_short: str = "") -> _ParsedLessonName:
        text = self._clean(lesson_name)
        match = self.HEADER_RE.match(text)

        if not match:
            return _ParsedLessonName("", "", tuple(), "")

        rest = self._clean(match.group("rest") or "")
        ordinal, rest_without_ordinal = self._extract_ordinal(rest)
        rooms_text = self._extract_rooms_text(rest_without_ordinal, teacher_short)

        return _ParsedLessonName(
            subject=self._clean(match.group("subject") or "").upper(),
            lesson_type=self._clean(match.group("type") or ""),
            rooms=self._parse_rooms(rooms_text),
            ordinal=ordinal,
        )

    @classmethod
    def _extract_ordinal(cls, rest: str) -> tuple[str, str]:
        match = cls.ORDINAL_RE.search(rest)

        if not match:
            return "", rest

        ordinal = match.group("ordinal")
        rest_without_ordinal = cls.ORDINAL_RE.sub("", rest).strip()
        return ordinal, rest_without_ordinal

    @classmethod
    def _extract_rooms_text(cls, rest: str, teacher_short: str) -> str:
        rooms_text = cls._clean(rest)
        teacher = cls._clean(teacher_short)

        if teacher and rooms_text.endswith(teacher):
            rooms_text = rooms_text[: -len(teacher)].strip()
        elif teacher == "-" and rooms_text.endswith("-"):
            rooms_text = rooms_text[:-1].strip()

        rooms_text = rooms_text.strip(" ,-")

        if set(rooms_text) <= {"-"}:
            return ""

        return rooms_text

    @classmethod
    def _parse_rooms(cls, rooms_text: str) -> tuple[WcyRoom, ...]:
        if not rooms_text:
            return tuple()

        return tuple(
            cls._parse_room(chunk)
            for chunk in cls._split_rooms(rooms_text)
            if chunk
        )

    @staticmethod
    def _split_rooms(rooms_text: str) -> Iterable[str]:
        return (
            chunk.strip(" ,-")
            for chunk in rooms_text.split(",")
            if chunk.strip(" ,-")
        )

    @classmethod
    def _parse_room(cls, room_text: str) -> WcyRoom:
        room = cls._clean(room_text)

        room_match = cls.ROOM_RE.match(room)
        if room_match:
            return WcyRoom(
                raw=room,
                number=int(room_match.group("number")),
                building=room_match.group("building"),
            )

        auditorium_match = cls.AUDITORIUM_RE.match(room)
        if auditorium_match:
            raw_number = auditorium_match.group("number")
            number = int(raw_number) if raw_number.isdecimal() else None
            return WcyRoom(
                raw=room,
                number=number,
                building=auditorium_match.group("building").upper(),
            )

        return WcyRoom(raw=room)

    @staticmethod
    def _clean(value: str) -> str:
        return re.sub(r"\s+", " ", value or "").strip()


class WcyLessonInfoParser:
    INFO_RE = re.compile(
        r"^(?P<subject>.*?)\s+-\s+\((?P<form>.*?)\)\s+-\s*(?P<teacher>.*?)\s*$"
    )

    def parse(self, lesson_info: str) -> _ParsedLessonInfo:
        info = self._clean(lesson_info)
        match = self.INFO_RE.match(info)

        if not match:
            return _ParsedLessonInfo(info, "", "")

        teacher = self._clean(match.group("teacher")).strip("-")

        return _ParsedLessonInfo(
            subject_full=self._clean(match.group("subject")).strip("-"),
            form=self._clean(match.group("form")),
            teacher=teacher,
        )

    @staticmethod
    def _clean(value: str) -> str:
        return re.sub(r"\s+", " ", value or "").strip()


class WcyGroupListParser:
    GROUP_RE = re.compile(r"^WCY[A-Za-z0-9]+$")

    def parse(self, html: str | BeautifulSoup) -> list[str]:
        soup = self._to_soup(html)
        groups: list[str] = []
        seen: set[str] = set()

        for option in soup.find_all("option"):
            group_name = option.get_text(strip=True)

            if not self.GROUP_RE.match(group_name) or group_name in seen:
                continue

            groups.append(group_name)
            seen.add(group_name)

        return groups

    @staticmethod
    def _to_soup(html: str | BeautifulSoup) -> BeautifulSoup:
        if isinstance(html, BeautifulSoup):
            return html

        return BeautifulSoup(html, "html.parser")


class WcyScheduleHtmlParser:
    def __init__(
        self,
        name_parser: WcyLessonNameParser | None = None,
        info_parser: WcyLessonInfoParser | None = None,
    ) -> None:
        self.name_parser = name_parser or WcyLessonNameParser()
        self.info_parser = info_parser or WcyLessonInfoParser()

    def parse(self, html: str | BeautifulSoup) -> list[WcyScheduleEntry]:
        soup = self._to_soup(html)
        entries: list[WcyScheduleEntry] = []
        seen: set[tuple[str, int | None, str, str, str]] = set()

        for lesson in soup.find_all("div", class_="lesson"):
            entry = self._parse_lesson(lesson)

            if entry is None:
                continue

            dedupe_key = (
                entry.date_key,
                entry.block,
                entry.raw_name,
                entry.raw_info,
                entry.teacher_short,
            )

            if dedupe_key in seen:
                continue

            entries.append(entry)
            seen.add(dedupe_key)

        return entries

    def _parse_lesson(self, lesson: Tag) -> WcyScheduleEntry | None:
        raw_date = self._text(lesson, "date")
        lesson_date = self._parse_date(raw_date)

        if lesson_date is None:
            return None

        block = self._parse_block(self._text(lesson, "block_id"))
        raw_name = self._text(lesson, "name")
        raw_info = self._text(lesson, "info")
        teacher_short = self._text(lesson, "sSkrotProwadzacego").strip("-")
        color = self._text(lesson, "colorp")

        parsed_name = self.name_parser.parse(raw_name, teacher_short)
        parsed_info = self.info_parser.parse(raw_info)

        return WcyScheduleEntry(
            date=lesson_date,
            block=block,
            subject=parsed_name.subject,
            lesson_type=parsed_name.lesson_type,
            rooms=parsed_name.rooms,
            ordinal=parsed_name.ordinal,
            subject_full=parsed_info.subject_full,
            form=parsed_info.form,
            teacher=parsed_info.teacher,
            teacher_short=teacher_short,
            raw_name=raw_name,
            raw_info=raw_info,
            color=color,
        )

    @staticmethod
    def _text(parent: Tag, class_name: str) -> str:
        tag = parent.find("span", class_=class_name)

        if tag is None:
            return ""

        return re.sub(r"\s+", " ", tag.get_text(" ", strip=True)).strip()

    @staticmethod
    def _parse_date(raw_date: str) -> date | None:
        try:
            return datetime.strptime(raw_date, "%Y_%m_%d").date()
        except ValueError:
            return None

    @staticmethod
    def _parse_block(raw_block: str) -> int | None:
        match = re.search(r"(\d+)", raw_block)

        if not match:
            return None

        return int(match.group(1))

    @staticmethod
    def _to_soup(html: str | BeautifulSoup) -> BeautifulSoup:
        if isinstance(html, BeautifulSoup):
            return html

        return BeautifulSoup(html, "html.parser")
