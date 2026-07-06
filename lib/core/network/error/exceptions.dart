class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});

  factory ServerException.withErrorCode(Map<String, dynamic> data) {
    return ServerException(
      message: data['error']?.toString() ?? 'Server not responding',
    );
  }

  @override
  String toString() => message;
}

class UnprocessableException implements Exception {
  final String message;

  const UnprocessableException({required this.message});

  factory UnprocessableException.withErrorCode(Map<String, dynamic> data) {
    return UnprocessableException(
      message: data['error']?.toString() ?? 'Unprocessable error',
    );
  }

  @override
  String toString() => message;
}

class ForbiddenException implements Exception {
  final String message;

  const ForbiddenException({required this.message});

  factory ForbiddenException.withErrorCode(Map<String, dynamic> data) {
    return ForbiddenException(
      message: data['error']?.toString() ?? 'Forbidden error',
    );
  }

  @override
  String toString() => message;
}

class ConflictException implements Exception {
  final String message;

  const ConflictException({required this.message});

  factory ConflictException.withErrorCode(Map<String, dynamic> data) {
    return ConflictException(
      message: data['error']?.toString() ?? 'Conflict error',
    );
  }

  @override
  String toString() => message;
}

class NotFoundException implements Exception {
  final String message;

  const NotFoundException({required this.message});

  factory NotFoundException.withErrorCode(dynamic data) {
    if (data is Map<String, dynamic>) {
      return NotFoundException(
        message: data['error']?.toString() ?? 'Not found error',
      );
    }

    return const NotFoundException(message: 'Not found error');
  }

  @override
  String toString() => message;
}

class InternalServerException implements Exception {
  final String message;

  const InternalServerException({required this.message});

  @override
  String toString() => message;
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
