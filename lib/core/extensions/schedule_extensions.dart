library;

DateTime startOfScheduleWeek(DateTime date) {
  final DateTime normalized = DateTime(date.year, date.month, date.day);

  return normalized.subtract(Duration(days: normalized.weekday - 1));
}

bool isSameScheduleWeek(DateTime firstDate, DateTime secondDate) {
  return startOfScheduleWeek(firstDate) == startOfScheduleWeek(secondDate);
}

class ScheduleRequestParameters {
  final String month;
  final String week;
  final String startDate;

  const ScheduleRequestParameters({
    required this.month,
    required this.week,
    required this.startDate,
  });

  factory ScheduleRequestParameters.forDate(DateTime date) {
    final DateTime monday = startOfScheduleWeek(date);

    return ScheduleRequestParameters(
      month: _polishMonthNames[monday.month],
      week: '${monday.day.toString().padLeft(2, '0')}'
          '${_romanMonths[monday.month]}',
      startDate: _formatDate(monday),
    );
  }

  static String _formatDate(DateTime date) {
    final String day = date.day.toString().padLeft(2, '0');
    final String month = date.month.toString().padLeft(2, '0');

    return '$day.$month.${date.year}';
  }

  static const List<String> _polishMonthNames = [
    '',
    'styczeń',
    'luty',
    'marzec',
    'kwiecień',
    'maj',
    'czerwiec',
    'lipiec',
    'sierpień',
    'wrzesień',
    'październik',
    'listopad',
    'grudzień',
  ];

  static const List<String> _romanMonths = [
    '',
    'I',
    'II',
    'III',
    'IV',
    'V',
    'VI',
    'VII',
    'VIII',
    'IX',
    'X',
    'XI',
    'XII',
  ];
}
