from datetime import datetime


def get_current_semester_range(today: datetime) -> str:
    """
    Determines the academic semester (zima or lato) and returns its date range.

    Args:
        today (datetime): The current date to evaluate.

    Returns:
        tuple[str, datetime, datetime]: A tuple containing:
            - semester name: 'zima' or 'lato'

    """
    if 3 <= today.month < 10:
        return "lato"

    return "zima"