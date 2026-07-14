from typing import Any


class WatScrapingError(RuntimeError):
    """Base application error with optional structured details."""

    def __init__(self, message: str, *, details: dict[str, Any] | None = None) -> None:
        super().__init__(message)
        self.details = details or {}


class ConfigurationError(WatScrapingError):
    """Raised when required configuration, credentials or runtime setup is invalid."""


class FileSystemOperationError(WatScrapingError):
    """Raised when the local filesystem cannot be read, written or cleaned."""


class SourceFetchError(WatScrapingError):
    """Raised when a remote schedule source cannot be fetched."""


class ScheduleConversionError(WatScrapingError):
    """Raised when raw source files cannot be converted into an intermediate format."""


class ScheduleParsingError(WatScrapingError):
    """Raised when a schedule cannot be parsed into domain/application data."""


class ScheduleMappingError(WatScrapingError):
    """Raised when parsed data cannot be mapped into the persistence shape."""


class ScheduleUploadError(WatScrapingError):
    """Raised when a schedule cannot be uploaded."""


class UploadQuotaExceededError(ScheduleUploadError):
    """Raised when the remote schedule store rejects writes because of quota."""
