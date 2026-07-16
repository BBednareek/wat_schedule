abstract final class ApiPaths {
  static const String basePath = 'http://127.0.0.1:8000';
  static const String facultyGroups = '/groups/faculty';

  static String weeklySchedule({
    required String group,
    required String month,
    required String week,
    required String startDate,
  }) =>
      '/schedule/$group/$month/$week?start_date=$startDate';
}
