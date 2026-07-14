from datetime import datetime
from re import match
from constants.constants import MONTH_PATTERN, MONTHS

def convert_date(date_str: str) -> str | None:
    date_str: str = date_str.strip()
    pattern_match = match(MONTH_PATTERN, date_str)

    if not pattern_match:
        return None

    #day: str
    #roman_month: str
    day, roman_month = pattern_match.groups()

    month: int | None = MONTHS.get(roman_month)
    year: int = datetime.now().year

    if not month:
        return None

    try:
        dt = datetime(year, month, int(day))
        return dt.strftime("%Y-%m-%d")
    except ValueError:
        return None