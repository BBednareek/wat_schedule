from collections import defaultdict
from typing import Any

from pandas import DataFrame, notna

from constants.constants import VALID_DAYS
from domain.schedule import ScheduleData
from infrastructure.plansoft.room_parser import RoomParser


class PlanParser:
    """Parses Plansoft table data into the Firestore schedule shape."""

    def __init__(self, df: DataFrame, group: str, active_columns: list[tuple[int, str, str]]):
        self.df = df
        self.group = group
        self.active_columns = active_columns

    def parse(self) -> dict[str, ScheduleData]:
        result: defaultdict[str, defaultdict[str, defaultdict[str, list[dict[str, Any]]]]] = (
            defaultdict(lambda: defaultdict(lambda: defaultdict(list)))
        )

        for col, month, week in self.active_columns:
            for row in range(2, self.df.shape[0]):
                day = self.df.iloc[row, 0]
                block = self.df.iloc[row, 1]
                activity = self.df.iloc[row, col]

                if not self._is_schedule_cell(day, block, activity):
                    continue

                day = day.strip()
                block = block.strip()
                activity = activity.strip()
                room, building = RoomParser.extract(activity)

                entity: dict[str, Any] = {
                    "block": block,
                    "activity": activity,
                }

                if room:
                    entity["room"] = room

                if building:
                    entity["building"] = building

                result[month][week][day].append(entity)

        return {self.group: self._to_plain_dict(result)}

    @staticmethod
    def _is_schedule_cell(day: Any, block: Any, activity: Any) -> bool:
        return (
            isinstance(day, str)
            and day.strip().lower() in VALID_DAYS
            and notna(block)
            and notna(activity)
            and isinstance(block, str)
            and isinstance(activity, str)
        )

    @staticmethod
    def _to_plain_dict(
        data: defaultdict[str, defaultdict[str, defaultdict[str, list[dict[str, Any]]]]],
    ) -> ScheduleData:
        return {
            month: {
                week: dict(days)
                for week, days in weeks.items()
            }
            for month, weeks in data.items()
        }
