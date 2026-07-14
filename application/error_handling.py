from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
import logging
import traceback
from pathlib import Path
from typing import Any

from domain.exceptions import (
    ConfigurationError,
    FileSystemOperationError,
    ScheduleConversionError,
    ScheduleMappingError,
    ScheduleParsingError,
    ScheduleUploadError,
    SourceFetchError,
    UploadQuotaExceededError,
    WatScrapingError,
)


class ErrorAction(str, Enum):
    CONTINUE = "continue"
    STOP = "stop"


class ErrorSeverity(str, Enum):
    WARNING = "warning"
    ERROR = "error"
    CRITICAL = "critical"


@dataclass(frozen=True)
class ErrorContext:
    operation: str
    component: str
    group_name: str | None = None
    source: str | None = None
    path: str | Path | None = None
    attempt: int | None = None
    extra: dict[str, Any] = field(default_factory=dict)

    def label(self) -> str:
        parts = [self.component, self.operation]

        if self.group_name:
            parts.append(f"group={self.group_name}")

        if self.source:
            parts.append(f"source={self.source}")

        if self.path:
            parts.append(f"path={self.path}")

        if self.attempt is not None:
            parts.append(f"attempt={self.attempt}")

        return " | ".join(parts)


@dataclass(frozen=True)
class ErrorDecision:
    action: ErrorAction
    severity: ErrorSeverity
    reason: str


@dataclass(frozen=True)
class ErrorRecord:
    timestamp: str
    context: ErrorContext
    exception_type: str
    message: str
    decision: ErrorDecision
    details: dict[str, Any]
    traceback_text: str | None = None


class ApplicationErrorHandler:
    STOP_OPERATIONS: frozenset[str] = frozenset(
        {
            "build_firestore_client",
            "create_working_directory",
            "cleanup_working_directory",
            "fetch_wcy_group_names",
            "fetch_plansoft_group_files",
            "download_plansoft_group_files",
            "convert_plansoft_html_to_excel",
            "find_plansoft_schedule_files",
        }
    )

    def __init__(
        self,
        logger: logging.Logger | None = None,
        include_traceback: bool = False,
    ) -> None:
        self.logger = logger or self._default_logger()
        self.include_traceback = include_traceback
        self.records: list[ErrorRecord] = []

    def handle(self, exc: BaseException, context: ErrorContext) -> ErrorDecision:
        decision = self._classify(exc, context)
        details = exc.details if isinstance(exc, WatScrapingError) else {}
        record = ErrorRecord(
            timestamp=datetime.now().isoformat(timespec="seconds"),
            context=context,
            exception_type=type(exc).__name__,
            message=str(exc),
            decision=decision,
            details=details,
            traceback_text=traceback.format_exc() if self.include_traceback else None,
        )

        self.records.append(record)
        self._log_record(record)
        return decision

    @staticmethod
    def should_stop(decision: ErrorDecision) -> bool:
        return decision.action == ErrorAction.STOP

    def has_stopping_errors(self) -> bool:
        return any(record.decision.action == ErrorAction.STOP for record in self.records)

    def _classify(self, exc: BaseException, context: ErrorContext) -> ErrorDecision:
        if isinstance(exc, KeyboardInterrupt):
            return ErrorDecision(
                action=ErrorAction.STOP,
                severity=ErrorSeverity.CRITICAL,
                reason="Run interrupted by user.",
            )

        if isinstance(exc, UploadQuotaExceededError):
            return ErrorDecision(
                action=ErrorAction.STOP,
                severity=ErrorSeverity.CRITICAL,
                reason="Remote write quota exceeded; continuing would repeat the same failure.",
            )

        if isinstance(exc, ConfigurationError):
            return ErrorDecision(
                action=ErrorAction.STOP,
                severity=ErrorSeverity.CRITICAL,
                reason="Configuration problem blocks the whole run.",
            )

        if isinstance(exc, FileSystemOperationError) and context.operation in self.STOP_OPERATIONS:
            return ErrorDecision(
                action=ErrorAction.STOP,
                severity=ErrorSeverity.ERROR,
                reason="Filesystem setup or discovery failed.",
            )

        if context.operation in self.STOP_OPERATIONS:
            return ErrorDecision(
                action=ErrorAction.STOP,
                severity=ErrorSeverity.ERROR,
                reason="Required pipeline step failed.",
            )

        if isinstance(
            exc,
            (
                SourceFetchError,
                ScheduleConversionError,
                ScheduleParsingError,
                ScheduleMappingError,
                ScheduleUploadError,
            ),
        ):
            return ErrorDecision(
                action=ErrorAction.CONTINUE,
                severity=ErrorSeverity.ERROR,
                reason="Group-level operation failed; next group can still be attempted.",
            )

        return ErrorDecision(
            action=ErrorAction.CONTINUE,
            severity=ErrorSeverity.ERROR,
            reason="Unexpected group-level error; isolated to current operation.",
        )

    def _log_record(self, record: ErrorRecord) -> None:
        message = (
            f"[{record.decision.severity.value.upper()}] "
            f"{record.context.label()} -> {record.exception_type}: {record.message} "
            f"({record.decision.action.value}; {record.decision.reason})"
        )

        if record.decision.severity == ErrorSeverity.CRITICAL:
            self.logger.critical(message)
        elif record.decision.severity == ErrorSeverity.ERROR:
            self.logger.error(message)
        else:
            self.logger.warning(message)

        if record.details:
            self.logger.debug("Error details: %s", record.details)

        if record.traceback_text:
            self.logger.debug(record.traceback_text)

    @staticmethod
    def _default_logger() -> logging.Logger:
        logging.basicConfig(
            level=logging.INFO,
            format="%(asctime)s %(levelname)s %(message)s",
        )
        return logging.getLogger("wat_scrapping")
