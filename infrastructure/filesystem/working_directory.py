from pathlib import Path
from shutil import rmtree

from domain.exceptions import FileSystemOperationError


class WorkingDirectory:
    def __init__(
        self,
        save_folder: str | Path,
        export_folder: str | Path,
        cleanup_on_exit: bool = True,
    ) -> None:
        self.save_folder = Path(save_folder)
        self.export_folder = Path(export_folder)
        self.cleanup_on_exit = cleanup_on_exit

    def create(self) -> None:
        try:
            self.save_folder.mkdir(parents=True, exist_ok=True)
            self.export_folder.mkdir(parents=True, exist_ok=True)
        except OSError as exc:
            raise FileSystemOperationError(
                "Cannot create working directories.",
                details={
                    "save_folder": str(self.save_folder),
                    "export_folder": str(self.export_folder),
                    "reason": str(exc),
                },
            ) from exc

    def cleanup(self) -> None:
        try:
            rmtree(self.save_folder, ignore_errors=True)
            rmtree(self.export_folder, ignore_errors=True)
        except OSError as exc:
            raise FileSystemOperationError(
                "Cannot clean working directories.",
                details={
                    "save_folder": str(self.save_folder),
                    "export_folder": str(self.export_folder),
                    "reason": str(exc),
                },
            ) from exc

    def __enter__(self) -> "WorkingDirectory":
        self.create()
        return self

    def __exit__(self, exc_type: object, exc: object, traceback: object) -> None:
        if self.cleanup_on_exit:
            self.cleanup()
