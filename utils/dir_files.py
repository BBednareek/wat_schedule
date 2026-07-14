from constants.constants import SAVE_FOLDER, EXPORT_FOLDER
from infrastructure.filesystem.working_directory import WorkingDirectory


def create_folders() -> None:
    """Creates necessary working directories for HTMLs, Excel files."""
    WorkingDirectory(SAVE_FOLDER, EXPORT_FOLDER, cleanup_on_exit=False).create()


def delete_folders() -> None:
    """Cleans up working directories after execution."""
    WorkingDirectory(SAVE_FOLDER, EXPORT_FOLDER, cleanup_on_exit=False).cleanup()
