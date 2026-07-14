from typing import Any, Protocol, TypeAlias

ScheduleEntryData: TypeAlias = dict[str, Any]
DaySchedule: TypeAlias = list[ScheduleEntryData]
WeekSchedule: TypeAlias = dict[str, DaySchedule]
MonthSchedule: TypeAlias = dict[str, WeekSchedule]
ScheduleData: TypeAlias = dict[str, MonthSchedule]


class ScheduleUploader(Protocol):
    def upload_schedule(self, group_name: str, data: ScheduleData) -> None:
        ...
