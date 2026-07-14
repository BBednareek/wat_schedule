from application.error_handling import ApplicationErrorHandler, ErrorContext
from application.ports import (
    PlansoftGroupFileSource,
    PlansoftHtmlToExcelConverter,
    PlansoftScheduleFileFinder,
    PlansoftScheduleParser,
)
from application.results import PlansoftSyncSummary
from domain.schedule import ScheduleUploader


class SyncPlansoftSchedulesUseCase:
    def __init__(
        self,
        group_file_source: PlansoftGroupFileSource,
        html_to_excel_converter: PlansoftHtmlToExcelConverter,
        schedule_file_finder: PlansoftScheduleFileFinder,
        schedule_parser: PlansoftScheduleParser,
        uploader: ScheduleUploader,
        error_handler: ApplicationErrorHandler | None = None,
    ) -> None:
        self.group_file_source = group_file_source
        self.html_to_excel_converter = html_to_excel_converter
        self.schedule_file_finder = schedule_file_finder
        self.schedule_parser = schedule_parser
        self.uploader = uploader
        self.error_handler = error_handler or ApplicationErrorHandler()

    def execute(self) -> PlansoftSyncSummary:
        print("Starting Plansoft schedule sync...")
        summary = PlansoftSyncSummary()

        try:
            group_files = self.group_file_source.fetch_group_files()
        except Exception as exc:
            self._handle_pipeline_error(summary, exc, "fetch_plansoft_group_files")
            return summary

        try:
            self.group_file_source.download_plans_async(group_files)
        except Exception as exc:
            if self._handle_pipeline_error(summary, exc, "download_plansoft_group_files"):
                return summary

        print("Converting Plansoft HTML files to Excel...")
        try:
            self.html_to_excel_converter.html_to_excel_parallel()
        except Exception as exc:
            if self._handle_pipeline_error(summary, exc, "convert_plansoft_html_to_excel"):
                return summary

        try:
            schedule_files = self.schedule_file_finder.iter_schedule_files()
        except Exception as exc:
            if self._handle_pipeline_error(summary, exc, "find_plansoft_schedule_files"):
                return summary

        summary.files_found = len(schedule_files)

        print(f"Parsing {len(schedule_files)} Plansoft Excel schedules...")

        for group_name, filepath in schedule_files:
            result = self._sync_group(group_name, filepath)

            if result == _GroupSyncResult.UPLOADED:
                summary.groups_uploaded += 1
            elif result == _GroupSyncResult.STOP:
                summary.failed += 1
                summary.failed_groups.append(group_name)
                break
            else:
                summary.failed += 1
                summary.failed_groups.append(group_name)

        print(
            "Plansoft sync done: "
            f"{summary.groups_uploaded} uploaded, "
            f"{summary.failed} failed."
        )

        return summary

    def _sync_group(self, group_name: str, filepath: object) -> "_GroupSyncResult":
        try:
            schedule = self.schedule_parser.parse_group_file(filepath, group_name)
        except Exception as exc:
            return self._handle_group_error(exc, "parse_plansoft_schedule_file", group_name, filepath)

        try:
            self.uploader.upload_schedule(group_name, schedule)
        except Exception as exc:
            return self._handle_group_error(exc, "upload_plansoft_schedule", group_name, filepath)

        return _GroupSyncResult.UPLOADED

    def _handle_pipeline_error(
        self,
        summary: PlansoftSyncSummary,
        exc: Exception,
        operation: str,
    ) -> bool:
        decision = self.error_handler.handle(
            exc,
            ErrorContext(
                operation=operation,
                component="plansoft_sync",
                source="plansoft",
            ),
        )
        summary.failed += 1
        return self.error_handler.should_stop(decision)

    def _handle_group_error(
        self,
        exc: Exception,
        operation: str,
        group_name: str,
        filepath: object,
    ) -> "_GroupSyncResult":
        decision = self.error_handler.handle(
            exc,
            ErrorContext(
                operation=operation,
                component="plansoft_sync",
                group_name=group_name,
                source="plansoft",
                path=str(filepath),
            ),
        )

        if self.error_handler.should_stop(decision):
            return _GroupSyncResult.STOP

        return _GroupSyncResult.FAILED


class _GroupSyncResult:
    UPLOADED = "uploaded"
    FAILED = "failed"
    STOP = "stop"
