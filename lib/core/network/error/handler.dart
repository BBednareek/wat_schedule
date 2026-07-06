import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wat_schedule/core/network/error/exceptions.dart';

mixin ErrorHandling {
  Exception handleException(dynamic error, {StackTrace? stackTrace}) {
    log('''
    -----------------------------------
      Exception: ${error.runtimeType}: ${error.toString()}
    -----------------------------------
    ''');

    if (error is UnprocessableException ||
        error is ConflictException ||
        error is NotFoundException ||
        error is ForbiddenException ||
        error is ServerException ||
        error is InternalServerException ||
        error is AuthException ||
        error is StorageException ||
        error is NoInternetConnectionException ||
        error is TooManyRequestsException) {
      return error;
    }

    if (error is TimeoutException) {
      return NoInternetConnectionException();
    }

    if (error is DioException) {
      return dioException(error);
    }

    if (error is Response) {
      return responseException(error);
    }

    return defaultException(error, stackTrace);
  }

  Exception responseException(Response response) {
    final dynamic data = response.data;

    if (data is! Map<String, dynamic>) {
      return const ServerException(message: 'Unexpected server response');
    }

    switch (response.statusCode) {
      case HttpStatus.forbidden:
        return ForbiddenException.withErrorCode(data);
      case HttpStatus.notFound:
        return NotFoundException.withErrorCode(data);
      case HttpStatus.unprocessableEntity:
        return UnprocessableException.withErrorCode(data);
      case HttpStatus.conflict:
        return ConflictException.withErrorCode(data);
      case HttpStatus.tooManyRequests:
        return TooManyRequestsException();
      case HttpStatus.internalServerError:
        return ServerException.withErrorCode(data);
      case HttpStatus.unauthorized:
        return AuthException();
    }

    return ServerException.withErrorCode(data);
  }

  Exception dioException(DioException dio) {
    switch (dio.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
        return NoInternetConnectionException();

      case DioExceptionType.receiveTimeout:
        return const ServerException(message: 'Server not responding');

      case DioExceptionType.badResponse:
        final Response<dynamic>? response = dio.response;

        if (response != null) {
          return responseException(response);
        }

        return const ServerException(message: 'Bad server response');

      default:
        return defaultException(dio.error, dio.stackTrace);
    }
  }

  Exception defaultException(dynamic error, StackTrace? stackTrace) {
    if (error is SocketException || error is TimeoutException) {
      return NoInternetConnectionException();
    }

    log('''
    ------------------------------------------------------

    Exception: $error

    StackTrace: ${stackTrace ?? "STACK IS NULL"}

    ------------------------------------------------------
    ''');

    return ServerException(
      message: error?.toString() ?? 'Unexpected error',
    );
  }
}
