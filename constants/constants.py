from utils.semester_util import get_current_semester_range
from datetime import datetime

SEMESTER = get_current_semester_range(today=datetime.today())
BASE_URL_PLANSOFT: list[str] = [
    f"https://plany.wel.wat.edu.pl/{SEMESTER}",
    f"https://www.wim.wat.edu.pl/wp-content/uploads/rozklady/{SEMESTER}/index.xml",
    f"https://wlo.wat.edu.pl/planzajec/{SEMESTER}/index.xml",
    "https://www.wtc.wat.edu.pl/Plany/index.xml",
]
XML_INDEX: list[str] = [
    url if url.endswith("index.xml") else f"{url}/index.xml"
    for url in BASE_URL_PLANSOFT
]

BASE_URL_WCY = "https://planzajec.wcy.wat.edu.pl/pl"

SAVE_FOLDER: str = "htmls"
EXPORT_FOLDER: str = "outputs"
CREDENTIALS_PATH = '../key.json'

FACULTY_PREFIXES: list[str] = ["WCY", "WME", "WLO", "WEL", "WIG", "WMT", "WTC", "IOE"]

VALID_DAYS: set[str] = {"pon.", "wt.", "śr.", "czw.", "pt."}

MONTHS: dict[str, int] = {
    "I": 1, "II": 2, "III": 3, "IV": 4, "V": 5, "VI": 6,
    "VII": 7, "VIII": 8, "IX": 9, "X": 10, "XI": 11, "XII": 12
}

MONTH_PATTERN: str = r"^(\d{1,2})\s+(I{1,3}|IV|V|VI{1,3}|IX|X|XI|XII)$"
ROOM_PATTERN: str = r"(\d{3})\s*(\d{2})"

ENCODING: str = "windows-1250"
