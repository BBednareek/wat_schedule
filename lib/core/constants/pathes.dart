import 'package:wat_schedule/core/constants/constants.dart';

// This file defines the API paths used in the application.
class Pathes extends Constants {
  static const String basePath = 'http://127.0.0.1:8000';
  static String getFacultyGroups = '/groups/faculty';
  static String getWeeklySchedule({
    required String group,
    required String month,
    required String week,
    // ignore: non_constant_identifier_names
    required String start_date,
  }) =>
      '/schedule/$group/$month/$week?start_date=$start_date';
}
