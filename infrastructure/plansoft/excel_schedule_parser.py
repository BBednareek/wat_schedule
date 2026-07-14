from pathlib import Path

from domain.exceptions import ScheduleParsingError
from domain.schedule import ScheduleData
from infrastructure.plansoft.excel_plan_loader import PlanLoader
from infrastructure.plansoft.table_plan_parser import PlanParser


class PlansoftExcelScheduleParser:
    def parse_group_file(self, filepath: Path, group_name: str) -> ScheduleData:
        try:
            loader = PlanLoader(str(filepath))
            active_columns = loader.get_active_columns()
            parsed = PlanParser(loader.df, group_name, active_columns).parse()
            return parsed[group_name]
        except ScheduleParsingError:
            raise
        except Exception as exc:
            raise ScheduleParsingError(
                "Cannot parse Plansoft Excel schedule file.",
                details={
                    "filepath": str(filepath),
                    "group_name": group_name,
                    "reason": str(exc),
                },
            ) from exc
