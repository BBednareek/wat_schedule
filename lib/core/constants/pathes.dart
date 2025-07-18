import 'package:wat_schedule/core/constants/constants.dart';

class Pathes extends Constants {

  static const String basePath = '127.0.0.1:8000';
  static String getFacultyGroups = '$basePath/groups/faculty';
  // ignore: non_constant_identifier_names
  static String getWeeklySchedule(String group, String month, String week, String start_date) => '$basePath/schedule/$group/$month/$week?start_date=$start_date';
  
}