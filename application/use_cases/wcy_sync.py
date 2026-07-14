from application.error_handling import ApplicationErrorHandler, ErrorContext
from application.ports import WcyScheduleMapper, WcyScheduleParser, WcyScheduleSource
from application.results import WcySyncSummary
from domain.schedule import ScheduleUploader


class WcyScheduleSyncUseCase:
    def __init__(
        self,
        source: WcyScheduleSource,
        parser: WcyScheduleParser,
        mapper: WcyScheduleMapper,
        uploader: ScheduleUploader,
        error_handler: ApplicationErrorHandler | None = None,
    ) -> None:
        self.source = source
        self.parser = parser
        self.mapper = mapper
        self.uploader = uploader
        self.error_handler = error_handler or ApplicationErrorHandler()

    def sync_all_groups(self) -> WcySyncSummary:
        summary = WcySyncSummary()

        try:
            group_names = self.source.fetch_group_names()
        except Exception as exc:
            decision = self.error_handler.handle(
                exc,
                ErrorContext(
                    operation="fetch_wcy_group_names",
                    component="wcy_sync",
                    source="wcy",
                ),
            )
            summary.failed += 1

            if self.error_handler.should_stop(decision):
                return summary

            group_names = []

        return self.sync_groups(group_names)

    def sync_groups(self, group_names: list[str]) -> WcySyncSummary:
        summary = WcySyncSummary(groups_total=len(group_names))
        print(f"Found {len(group_names)} WCY groups.")

        for index, group_name in enumerate(group_names, start=1):
            result = self._sync_group(group_name)

            if result == _GroupSyncResult.UPLOADED:
                summary.uploaded += 1
                print(f"Uploaded WCY group {index}/{len(group_names)}: {group_name}")
            elif result == _GroupSyncResult.SKIPPED:
                summary.skipped += 1
                print(f"No WCY schedule entries for group {index}/{len(group_names)}: {group_name}")
            elif result == _GroupSyncResult.STOP:
                summary.failed += 1
                summary.failed_groups.append(group_name)
                break
            else:
                summary.failed += 1
                summary.failed_groups.append(group_name)

        print(
            "WCY sync done: "
            f"{summary.uploaded} uploaded, "
            f"{summary.skipped} skipped, "
            f"{summary.failed} failed."
        )

        return summary

    def _sync_group(self, group_name: str) -> "_GroupSyncResult":
        try:
            html = self.source.fetch_schedule_html(group_name)
        except Exception as exc:
            return self._handle_group_error(exc, "fetch_wcy_schedule_html", group_name)

        try:
            entries = self.parser.parse(html)
        except Exception as exc:
            return self._handle_group_error(exc, "parse_wcy_schedule_html", group_name)

        if not entries:
            return _GroupSyncResult.SKIPPED

        try:
            schedule = self.mapper.map_entries(entries)
        except Exception as exc:
            return self._handle_group_error(exc, "map_wcy_schedule", group_name)

        try:
            self.uploader.upload_schedule(group_name, schedule)
        except Exception as exc:
            return self._handle_group_error(exc, "upload_wcy_schedule", group_name)

        return _GroupSyncResult.UPLOADED

    def _handle_group_error(
        self,
        exc: Exception,
        operation: str,
        group_name: str,
    ) -> "_GroupSyncResult":
        decision = self.error_handler.handle(
            exc,
            ErrorContext(
                operation=operation,
                component="wcy_sync",
                group_name=group_name,
                source="wcy",
            ),
        )

        if self.error_handler.should_stop(decision):
            return _GroupSyncResult.STOP

        return _GroupSyncResult.FAILED


class _GroupSyncResult:
    UPLOADED = "uploaded"
    SKIPPED = "skipped"
    FAILED = "failed"
    STOP = "stop"
