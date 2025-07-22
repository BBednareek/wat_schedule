/// Generates a map of schedule parameters based on the current date.
/// The parameters include the month name in Polish, the week number,
/// and the start date of the week.
/// The week number is calculated based on the first Monday of the month.
/// The month name is in Polish, and the week number is represented in Roman numerals.
/// The start date is formatted as "DD.MM.YYYY".
library;

Map<String, String> generateScheduleParams({required DateTime now}) {
  String getPolishMonthName({required int month}) {
    const List<String> months = [
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
      'grudzień'
    ];
    return months[month];
  }

  String toRoman({required int number}) {
    const Map<int, String> map = {
      1: 'I',
      2: 'II',
      3: 'III',
      4: 'IV',
      5: 'V',
      6: 'VI',
      7: 'VII',
      8: 'VIII',
      9: 'IX',
      10: 'X',
      11: 'XI',
      12: 'XII'
    };
    return map[number] ?? number.toString();
  }

  final DateTime currentMonday = now.subtract(Duration(days: now.weekday - 1));

  DateTime firstOfMonth = DateTime(now.year, now.month, 1);

  while (firstOfMonth.weekday != DateTime.monday)
    firstOfMonth = firstOfMonth.add(const Duration(days: 1));

  DateTime iter = firstOfMonth;

  while (iter.isBefore(currentMonday)) {
    iter = iter.add(const Duration(days: 7));
  }

  final String week =
      "${currentMonday.day.toString().padLeft(2, '0')}${toRoman(number: currentMonday.month)}";

  final String month = getPolishMonthName(month: now.month);
  final String startDate =
      "${currentMonday.day.toString().padLeft(2, '0')}.${currentMonday.month.toString().padLeft(2, '0')}.${currentMonday.year}";

  return {
    'month': month,
    'week': week,
    'start_date': startDate,
  };
}
