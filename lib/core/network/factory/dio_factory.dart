import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wat_schedule/core/constants/pathes.dart';
import 'package:wat_schedule/core/network/error/handler.dart';

abstract class DioFactory with ErrorHandling {
  Dio getDio({String? url, Map<String, dynamic>? headers});

  Future<Map<String, dynamic>> get(
    String route, {
    Map<String, dynamic>? params,
  });
}

@LazySingleton(as: DioFactory)
class DioFactoryImpl extends DioFactory {
  late final Dio _dio = getDio();

  DioFactoryImpl();

  @override
  Dio getDio({String? url, Map<String, dynamic>? headers}) => Dio(BaseOptions(
      baseUrl: url ?? Pathes.basePath,
      contentType: 'application/json',
      responseType: ResponseType.json,
      headers: headers,
      validateStatus: (int? status) =>
          status! >= HttpStatus.ok && status <= HttpStatus.imUsed));

  @override
  Future<Map<String, dynamic>> get(
    String route, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response<dynamic> result = await _dio.get(
        route,
        queryParameters: params,
        options: Options(headers: headers),
      );

      return result.data;
    } catch (e) {
      throw handleException(e);
    }
  }
}
