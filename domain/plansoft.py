from dataclasses import dataclass


@dataclass(frozen=True)
class ScheduleEntry:
    date: str
    hour: str
    details: str
