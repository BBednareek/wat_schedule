from os import getenv

from application.error_handling import ApplicationErrorHandler, ErrorContext
from application.mappers import WcyFirestoreScheduleMapper
from application.use_cases import SyncPlansoftSchedulesUseCase, WcyScheduleSyncUseCase
from constants.constants import (
    BASE_URL_PLANSOFT,
    BASE_URL_WCY,
    CREDENTIALS_PATH,
    EXPORT_FOLDER,
    FACULTY_PREFIXES,
    SAVE_FOLDER,
)
from infrastructure.filesystem import LocalExcelScheduleFileFinder, WorkingDirectory
from infrastructure.firestore import FirestoreScheduleUploader
from infrastructure.plansoft import (
    ExcelFetcher,
    FacultyGroupFetcher,
    PlansoftExcelScheduleParser,
)
from infrastructure.wcy import (
    RequestsWcyScheduleClient,
    WcyScheduleHtmlParser,
)
from urllib3 import disable_warnings, exceptions

disable_warnings(exceptions.InsecureRequestWarning)

ERROR_HANDLER = ApplicationErrorHandler()


def _enabled_sources() -> set[str]:
    raw_sources = getenv("WAT_SYNC_SOURCES", "plansoft,wcy")
    sources = {
        source.strip().lower()
        for source in raw_sources.split(",")
        if source.strip()
    }
    supported_sources = {"plansoft", "wcy"}
    unknown_sources = sources - supported_sources

    if unknown_sources:
        ERROR_HANDLER.handle(
            ValueError(f"Unsupported sync sources: {sorted(unknown_sources)}"),
            ErrorContext(
                operation="parse_enabled_sources",
                component="entrypoint",
                extra={"raw_sources": raw_sources},
            ),
        )

    return sources & supported_sources


def _selected_wcy_groups(source: RequestsWcyScheduleClient) -> list[str] | None:
    raw_groups = getenv("WAT_WCY_GROUPS")

    if raw_groups:
        return [
            group.strip()
            for group in raw_groups.split(",")
            if group.strip()
        ]

    group_limit = _wcy_group_limit()
    start_from = getenv("WAT_WCY_START_FROM")

    if group_limit is None and not start_from:
        return None

    groups = source.fetch_group_names()

    if start_from and start_from in groups:
        groups = groups[groups.index(start_from):]

    if group_limit is not None:
        groups = groups[:group_limit]

    return groups


def _wcy_group_limit() -> int | None:
    raw_limit = getenv("WAT_WCY_LIMIT")

    if not raw_limit:
        return None

    try:
        return max(0, int(raw_limit))
    except ValueError:
        ERROR_HANDLER.handle(
            ValueError(f"Invalid WAT_WCY_LIMIT={raw_limit!r}"),
            ErrorContext(
                operation="parse_wcy_group_limit",
                component="entrypoint",
                extra={"raw_limit": raw_limit},
            ),
        )
        return None


def build_plansoft_sync_use_case(
    uploader: FirestoreScheduleUploader,
) -> SyncPlansoftSchedulesUseCase:
    return SyncPlansoftSchedulesUseCase(
        group_file_source=FacultyGroupFetcher(
            base_urls=BASE_URL_PLANSOFT,
            faculty_prefixes=FACULTY_PREFIXES,
        ),
        html_to_excel_converter=ExcelFetcher(),
        schedule_file_finder=LocalExcelScheduleFileFinder(EXPORT_FOLDER),
        schedule_parser=PlansoftExcelScheduleParser(),
        uploader=uploader,
        error_handler=ERROR_HANDLER,
    )


def build_wcy_sync_use_case(
    uploader: FirestoreScheduleUploader,
    source: RequestsWcyScheduleClient,
) -> WcyScheduleSyncUseCase:
    return WcyScheduleSyncUseCase(
        source=source,
        parser=WcyScheduleHtmlParser(),
        mapper=WcyFirestoreScheduleMapper(),
        uploader=uploader,
        error_handler=ERROR_HANDLER,
    )


def main() -> None:
    """
    Orchestrates fetching, parsing and Firestore upload for supported WAT schedules.
    """
    print("Starting faculty group schedule fetcher...")

    try:
        with WorkingDirectory(SAVE_FOLDER, EXPORT_FOLDER):
            uploader = FirestoreScheduleUploader(credentials_path=CREDENTIALS_PATH)
            enabled_sources = _enabled_sources()

            if "plansoft" in enabled_sources:
                build_plansoft_sync_use_case(uploader).execute()

            if "wcy" in enabled_sources:
                wcy_source = RequestsWcyScheduleClient(base_url=BASE_URL_WCY)
                wcy_use_case = build_wcy_sync_use_case(uploader, wcy_source)
                selected_groups = _selected_wcy_groups(wcy_source)

                if selected_groups is None:
                    wcy_use_case.sync_all_groups()
                else:
                    wcy_use_case.sync_groups(selected_groups)

            if ERROR_HANDLER.has_stopping_errors():
                print("Finished with stopping errors.")
                raise SystemExit(1)

            print("Done.")
    except KeyboardInterrupt as exc:
        ERROR_HANDLER.handle(
            exc,
            ErrorContext(
                operation="run_application",
                component="entrypoint",
            ),
        )
        raise SystemExit(130) from exc
    except Exception as exc:
        ERROR_HANDLER.handle(
            exc,
            ErrorContext(
                operation="run_application",
                component="entrypoint",
            ),
        )
        raise SystemExit(1) from exc


if __name__ == "__main__":
    main()
