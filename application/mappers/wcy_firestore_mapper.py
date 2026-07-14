from collections import defaultdict
from datetime import date, timedelta
from typing import Any

from domain.exceptions import ScheduleMappingError
from domain.schedule import ScheduleData
from domain.wcy import WcyScheduleEntry


POLISH_MONTH_NAMES: dict[int, str] = {
    1: "styczeń",
    2: "luty",
    3: "marzec",
    4: "kwiecień",
    5: "maj",
    6: "czerwiec",
    7: "lipiec",
    8: "sierpień",
    9: "wrzesień",
    10: "październik",
    11: "listopad",
    12: "grudzień",
}

ROMAN_MONTHS: dict[int, str] = {
    1: "I",
    2: "II",
    3: "III",
    4: "IV",
    5: "V",
    6: "VI",
    7: "VII",
    8: "VIII",
    9: "IX",
    10: "X",
    11: "XI",
    12: "XII",
}


class WcyFirestoreScheduleMapper:
    def map_entries(self, entries: list[WcyScheduleEntry]) -> ScheduleData:
        try:
            schedule: defaultdict[str, defaultdict[str, defaultdict[str, list[dict[str, Any]]]]] = (
                defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
            )

            for entry in sorted(entries, key=lambda item: (item.date, item.block or 0, item.raw_name)):
                week_start = self._week_start(entry.date)
                month_key = self._month_key(week_start)
                week_key = self._week_key(week_start)
                day_key = entry.weekday

                schedule[month_key][week_key][day_key].append(self._entry_to_dict(entry))

            return {
                month: {
                    week: dict(days)
                    for week, days in weeks.items()
                }
                for month, weeks in schedule.items()
            }
        except Exception as exc:
            raise ScheduleMappingError(
                "Cannot map WCY schedule entries into Firestore document shape.",
                details={
                    "entries_count": len(entries),
                    "reason": str(exc),
                },
            ) from exc

    def _entry_to_dict(self, entry: WcyScheduleEntry) -> dict[str, Any]:
        data: dict[str, Any] = {
            "block": str(entry.block) if entry.block is not None else "",
            "activity": entry.raw_name,
        }

        primary_room = entry.primary_room
        if primary_room is not None:
            if primary_room.number is not None:
                data["room"] = str(primary_room.number)
            else:
                data["room"] = primary_room.raw

            if primary_room.building:
                data["building"] = primary_room.building

        return data

    @staticmethod
    def _month_key(entry_date: date) -> str:
        return POLISH_MONTH_NAMES[entry_date.month]

    @staticmethod
    def _week_key(week_start: date) -> str:
        return f"{week_start.day:02d}{ROMAN_MONTHS[week_start.month]}"

    @staticmethod
    def _week_start(entry_date: date) -> date:
        return entry_date - timedelta(days=entry_date.weekday())
