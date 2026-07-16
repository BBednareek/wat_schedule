class ServerException implements Exception {
  final String errorMessage;

  const ServerException({required this.errorMessage});

  factory ServerException.withErrorCode(Map<String, dynamic> data) {
    return ServerException(
      errorMessage: data['error']?.toString() ?? 'Server not responding',
    );
  }

  @override
  String toString() => errorMessage;
}

class UnprocessableException implements Exception {
  final String errorMessage;

  const UnprocessableException({required this.errorMessage});

  factory UnprocessableException.withErrorCode(Map<String, dynamic> data) {
    return UnprocessableException(
      errorMessage: data['error']?.toString() ?? 'Unprocessable error',
    );
  }

  @override
  String toString() => errorMessage;
}

class ForbiddenException implements Exception {
  final String errorMessage;

  const ForbiddenException({required this.errorMessage});

  factory ForbiddenException.withErrorCode(Map<String, dynamic> data) {
    return ForbiddenException(
      errorMessage: data['error']?.toString() ?? 'Forbidden error',
    );
  }

  @override
  String toString() => errorMessage;
}

class ConflictException implements Exception {
  final String errorMessage;

  const ConflictException({required this.errorMessage});

  factory ConflictException.withErrorCode(Map<String, dynamic> data) {
    return ConflictException(
      errorMessage: data['error']?.toString() ?? 'Conflict error',
    );
  }

  @override
  String toString() => errorMessage;
}

class NotFoundException implements Exception {
  final String errorMessage;

  const NotFoundException({required this.errorMessage});

  factory NotFoundException.withErrorCode(dynamic data) {
    if (data is Map<String, dynamic>) {
      return NotFoundException(
        errorMessage: data['error']?.toString() ?? 'Not found error',
      );
    }

    return const NotFoundException(errorMessage: 'Not found error');
  }

  @override
  String toString() => errorMessage;
}

class InternalServerException implements Exception {
  final String errorMessage;

  const InternalServerException({required this.errorMessage});

  @override
  String toString() => errorMessage;
}

class AuthException implements Exception {
  const AuthException();

  @override
  String toString() => 'Authentication error';
}

class StorageException implements Exception {
  const StorageException();

  @override
  String toString() => 'Storage error';
}

class NoInternetConnectionException implements Exception {
  const NoInternetConnectionException();

  @override
  String toString() => 'No internet connection';
}

class TooManyRequestsException implements Exception {
  const TooManyRequestsException();

  @override
  String toString() => 'Too many requests';
}
