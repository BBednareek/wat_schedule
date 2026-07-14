from typing import Any

from firebase_admin import credentials, firestore, get_app, initialize_app
from google.api_core.exceptions import GoogleAPICallError, ResourceExhausted
from google.cloud.firestore_v1 import DocumentReference, WriteBatch

from domain.exceptions import ConfigurationError, ScheduleUploadError, UploadQuotaExceededError
from domain.schedule import ScheduleData


class FirestoreScheduleUploader:
    """
    Uploads schedule data to Firestore in batches.

    Structure:
        groups/{group}/{month}/{week}/days/{day} -> { entries: [...] }
    """

    def __init__(
        self,
        credentials_path: str,
        batch_limit: int = 450,
        commit_timeout_seconds: int = 30,
    ) -> None:
        self.credentials_path = credentials_path
        self.batch_limit = batch_limit
        self.commit_timeout_seconds = commit_timeout_seconds
        self.db = self._build_client(credentials_path)

    @staticmethod
    def _build_client(credentials_path: str) -> Any:
        try:
            cred = credentials.Certificate(credentials_path)
        except Exception as exc:
            raise ConfigurationError(
                "Cannot load Firebase credentials.",
                details={
                    "credentials_path": credentials_path,
                    "reason": str(exc),
                },
            ) from exc

        try:
            get_app()
        except ValueError:
            try:
                initialize_app(cred)
            except Exception as exc:
                raise ConfigurationError(
                    "Cannot initialize Firebase application.",
                    details={"reason": str(exc)},
                ) from exc

        try:
            return firestore.client()
        except Exception as exc:
            raise ConfigurationError(
                "Cannot create Firestore client.",
                details={"reason": str(exc)},
            ) from exc

    def upload_schedule(self, group_name: str, data: ScheduleData) -> None:
        print(f"Uploading schedule for group: {group_name}")

        batch: WriteBatch = self.db.batch()
        op_count = self._set_group_document(batch, group_name)
        initialized_weeks: set[tuple[str, str]] = set()

        for month, weeks in data.items():
            for week, days in weeks.items():
                week_key = (month, week)

                if week_key not in initialized_weeks:
                    batch.set(
                        self._week_document(group_name, month, week),
                        {"updated_at": firestore.SERVER_TIMESTAMP},
                        merge=True,
                    )
                    initialized_weeks.add(week_key)
                    op_count += 1

                    if op_count == self.batch_limit:
                        self._commit_batch(batch)
                        batch = self.db.batch()
                        op_count = 0

                for day, entries in days.items():
                    doc_ref = self._day_document(group_name, month, week, day)
                    batch.set(doc_ref, {"entries": entries})
                    op_count += 1

                    if op_count == self.batch_limit:
                        self._commit_batch(batch)
                        print(f"Committed {self.batch_limit} writes...")
                        batch = self.db.batch()
                        op_count = 0

        if op_count > 0:
            self._commit_batch(batch)
            print(f"Final commit: {op_count} writes.")

        print(f"Upload complete for group: {group_name}")

    def _set_group_document(self, batch: WriteBatch, group_name: str) -> int:
        batch.set(
            self.db.collection("groups").document(group_name),
            {
                "name": group_name,
                "updated_at": firestore.SERVER_TIMESTAMP,
            },
            merge=True,
        )
        return 1

    def _commit_batch(self, batch: WriteBatch) -> None:
        try:
            batch.commit(retry=None, timeout=self.commit_timeout_seconds)
        except ResourceExhausted as exc:
            raise UploadQuotaExceededError(
                "Firestore quota exceeded while writing schedules. "
                "Wait for quota reset, reduce the number of groups, or enable billing."
            ) from exc
        except GoogleAPICallError as exc:
            raise ScheduleUploadError(
                "Firestore rejected a schedule batch write.",
                details={"reason": str(exc)},
            ) from exc
        except Exception as exc:
            raise ScheduleUploadError(
                "Unexpected Firestore batch write failure.",
                details={"reason": str(exc)},
            ) from exc

    def _week_document(
        self,
        group_name: str,
        month: str,
        week: str,
    ) -> DocumentReference:
        return (
            self.db.collection("groups")
            .document(group_name)
            .collection(month)
            .document(week.replace(" ", ""))
        )

    def _day_document(
        self,
        group_name: str,
        month: str,
        week: str,
        day: str,
    ) -> DocumentReference:
        return (
            self.db.collection("groups")
            .document(group_name)
            .collection(month)
            .document(week.replace(" ", ""))
            .collection("days")
            .document(day)
        )
