import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:wat_schedule/core/network/error/exceptions.dart';

enum FailureType {
  unknown,
  server,
  notFound,
  unprocessable,
  forbidden,
  conflict,
  connectionTimeout,
  noInternet,
  tooManyRequests,
  storage,
}

class Failure extends Equatable {
  final FailureType type;
  final String errorCode;
  final String message;

  const Failure({
    required this.type,
    required this.errorCode,
    required this.message,
  });

  factory Failure.throwable(dynamic e) {
    if (e is UnprocessableException) {
      return Failure(
        type: FailureType.unprocessable,
        errorCode: 'unprocessable',
        message: e.message,
      );
    } else if (e is ConflictException) {
      return Failure(
        type: FailureType.conflict,
        errorCode: 'conflict',
        message: e.message,
      );
    } else if (e is NotFoundException) {
      return Failure(
        type: FailureType.notFound,
        errorCode: 'not_found',
        message: e.message,
      );
    } else if (e is ForbiddenException) {
      return Failure(
        type: FailureType.forbidden,
        errorCode: 'forbidden',
        message: e.message,
      );
    } else if (e is ServerException) {
      return Failure(
        type: FailureType.server,
        errorCode: 'server_exception',
        message: e.message,
      );
    } else if (e is NoInternetConnectionException || e is SocketException) {
      return const Failure(
        type: FailureType.noInternet,
        errorCode: 'no_internet',
        message: 'No internet connection',
      );
    } else if (e is TooManyRequestsException) {
      return const Failure(
        type: FailureType.tooManyRequests,
        errorCode: 'too_many_requests',
        message: 'Too many requests',
      );
    } else {
      return const Failure(
        type: FailureType.unknown,
        errorCode: 'unknown_failure',
        message: 'An unknown error occurred',
      );
    }
  }

  @override
  List<Object> get props => [type, message];

  @override
  String toString() => message;
}
