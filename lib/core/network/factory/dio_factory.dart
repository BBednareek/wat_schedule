import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wat_schedule/core/constants/api_paths.dart';
import 'package:wat_schedule/core/network/error/handler.dart';

// This file defines the DioFactory which is responsible for creating Dio instances
// and handling network requests. It uses dependency injection to provide the necessary
// dependencies and allows for easy testing and mocking of network calls.
abstract class DioFactory with ErrorHandling {
  // This method returns a Dio instance with the specified base URL and headers.
  // It can be used to create a Dio instance with custom configurations.
  Dio createDio({String? url, Map<String, dynamic>? headers});

  // This method performs a GET request to the specified route with optional parameters and headers.
  // It returns a Future that resolves to a Map containing the response data.
  Future<Map<String, dynamic>> get(
    String route, {
    Map<String, dynamic>? queryParameters,
  });
}

// This class implements the DioFactory and provides the actual implementation
// for creating Dio instances and handling GET requests.
@LazySingleton(as: DioFactory)
class DioFactoryImpl extends DioFactory {
  late final Dio _dio = createDio();

  DioFactoryImpl();

  // This method returns a Dio instance with the specified base URL and headers.
  // It uses the BaseOptions class to set the base URL, content type, response type, headers, and status validation.
  // The validateStatus function checks if the status code is within the range of 200 to 226,
  // which indicates a successful response.
  // If the status code is outside this range, it will throw an exception.
  @override
  Dio createDio({String? url, Map<String, dynamic>? headers}) =>
      Dio(BaseOptions(
          baseUrl: url ?? ApiPaths.basePath,
          contentType: 'application/json',
          responseType: ResponseType.json,
          headers: headers,
          validateStatus: (int? status) =>
              status! >= HttpStatus.ok && status <= HttpStatus.imUsed))
        ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
          enabled: kDebugMode,
        ));

  // This method performs a GET request to the specified route with optional parameters and headers.
  // It uses the Dio instance to make the request and returns the response data as a Map.
  // If an error occurs during the request, it will throw an exception handled by the ErrorHandling mixin.
  @override
  Future<Map<String, dynamic>> get(
    String route, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response<dynamic> result = await _dio.get(
        route,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return result.data;
    } catch (e) {
      throw handleException(e);
    }
  }
}
