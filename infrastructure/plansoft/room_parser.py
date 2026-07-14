from re import Match, search

from constants.constants import ROOM_PATTERN


class RoomParser:
    """Extracts room number and building number from a schedule string."""

    @staticmethod
    def extract(activity: str) -> tuple[str | None, str | None]:
        is_match: Match[str] | None = search(ROOM_PATTERN, activity)

        if is_match:
            return is_match.group(1), is_match.group(2)

        return None, None
