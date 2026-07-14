from infrastructure.firestore.schedule_uploader import FirestoreScheduleUploader


class FirestoreUploader(FirestoreScheduleUploader):
    """Backward-compatible name for the Firestore schedule adapter."""


__all__ = ["FirestoreUploader"]
