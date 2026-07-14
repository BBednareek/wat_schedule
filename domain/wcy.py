from dataclasses import dataclass
from datetime import date


BLOCK_TIMES: dict[int, str] = {
    1: "08:00-09:35",
    2: "09:50-11:25",
    3: "11:40-13:15",
    4: "13:30-15:05",
    5: "16:00-17:35",
    6: "17:50-19:25",
    7: "19:40-21:15",
}

WEEKDAYS_PL: tuple[str, ...] = (
    "pon.",
    "wt.",
    "śr.",
    "czw.",
    "pt.",
    "sob.",
    "niedz.",
)


@dataclass(frozen=True)
class WcyRoom:
    raw: str
    number: int | None = None
    building: str = ""


@dataclass(frozen=True)
class WcyScheduleEntry:
    date: date
    block: int | None
    subject: str
    lesson_type: str
    rooms: tuple[WcyRoom, ...]
    ordinal: str
    subject_full: str
    form: str
    teacher: str
    teacher_short: str
    raw_name: str
    raw_info: str
    color: str

    @property
    def date_key(self) -> str:
        return self.date.isoformat()

    @property
    def weekday(self) -> str:
        return WEEKDAYS_PL[self.date.weekday()]

    @property
    def block_label(self) -> str:
        if self.block is None:
            return ""

        return f"block{self.block}"

    @property
    def time(self) -> str:
        if self.block is None:
            return ""

        return BLOCK_TIMES.get(self.block, "")

    @property
    def primary_room(self) -> WcyRoom | None:
        if not self.rooms:
            return None

        return self.rooms[0]
