import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/network/factory/dio_factory.dart';

abstract class ScheduleRemoteDatasource {
  Future<Map<String, dynamic>> get(); //ToDo - entity
}

@LazySingleton(as: ScheduleRemoteDatasource)
class ScheduleRemoteDatasourceImpl implements ScheduleRemoteDatasource {
  final DioFactory dioFactory;

  ScheduleRemoteDatasourceImpl({required this.dioFactory});
  
  @override
  Future<Map<String, dynamic>> get() async {
    try {
      //ToDo - Result
    } catch (e, st) {
      dioFactory.handleException(e, stackTrace: st);
    }
    throw UnimplementedError();
  }

  
}

