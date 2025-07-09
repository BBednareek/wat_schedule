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
      return const Failure(
        type: FailureType.unprocessable,
        errorCode: 'unprocessable',
        message: 'unprocessable',
      );
    } else if (e is ConflictException) {
      return const Failure(
        type: FailureType.conflict,
        errorCode: 'conflict',
        message: 'conflict',
      );
    } else if (e is NotFoundException) {
      return const Failure(
        type: FailureType.notFound,
        errorCode: 'Not found',
        message: 'Not found',
      );
    } else if (e is ForbiddenException) {
      return const Failure(
        type: FailureType.forbidden,
        errorCode: 'forbidden',
        message: 'forbidden',
      );
    } else if (e is ServerException) {
      return const Failure(
        type: FailureType.server,
        errorCode: 'Server exception',
        message: 'Server exception',
      );
    } else if (e is NoInternetConnectionException || e is SocketException) {
      return const Failure(
        type: FailureType.noInternet,
        errorCode: 'No internet connection',
        message: 'No internet connection',
      );
    } else if (e is TooManyRequestsException) {
      return const Failure(
        type: FailureType.tooManyRequests,
        errorCode: 'Too many requests',
        message: 'Too many requests',
      );
    } else if (e is ServerException) {
      return Failure(
          type: FailureType.server, errorCode: e.message, message: e.message);
    }
    return const Failure(
      type: FailureType.unknown,
      errorCode: 'unknown failure',
      message: 'unknown failure',
    );
  }

  @override
  List<Object> get props => [type, message];

  @override
  String toString() => message;
}