from pandas import notna, read_excel

from domain.exceptions import ScheduleParsingError


class PlanLoader:
    """Loads and processes a Plansoft Excel schedule file."""

    def __init__(self, filepath: str, sheet_name: str = "Schedules") -> None:
        self.filepath = filepath
        self.sheet_name = sheet_name

        try:
            self.df = read_excel(filepath, sheet_name=sheet_name, header=None)
        except Exception as exc:
            raise ScheduleParsingError(
                "Cannot read Plansoft Excel schedule file.",
                details={
                    "filepath": filepath,
                    "sheet_name": sheet_name,
                    "reason": str(exc),
                },
            ) from exc

    def get_active_columns(self) -> list[tuple[int, str, str]]:
        columns: list[tuple[int, str, str]] = []

        for col in range(2, self.df.shape[1]):
            month = self.df.iloc[0, col]
            week = self.df.iloc[1, col]

            if notna(month) and notna(week):
                columns.append((col, str(month).strip(), str(week).strip()))

        return columns
