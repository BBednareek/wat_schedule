from pathlib import Path

from domain.exceptions import FileSystemOperationError


class LocalExcelScheduleFileFinder:
    def __init__(self, export_folder: str | Path) -> None:
        self.export_folder = Path(export_folder)

    def iter_schedule_files(self) -> list[tuple[str, Path]]:
        try:
            if not self.export_folder.exists():
                return []

            return [
                (filepath.stem, filepath)
                for filepath in sorted(self.export_folder.iterdir())
                if filepath.is_file() and filepath.suffix == ".xlsx"
            ]
        except OSError as exc:
            raise FileSystemOperationError(
                "Cannot list exported Excel schedule files.",
                details={
                    "export_folder": str(self.export_folder),
                    "reason": str(exc),
                },
            ) from exc
