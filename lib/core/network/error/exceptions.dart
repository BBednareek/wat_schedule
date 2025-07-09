
class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});

  factory ServerException.withErrorCode(Map<String, dynamic> data) =>
      const ServerException(message: 'Server not responding');
}

class UnprocessableException implements Exception {
  final String message;

  UnprocessableException({required this.message});

  factory UnprocessableException.withErrorCode(Map<String, dynamic> data) =>
      UnprocessableException(message: 'Unprocessable error');
}

class ForbiddenException implements Exception {
  final String message;

  ForbiddenException({required this.message});

  factory ForbiddenException.withErrorCode(Map<String, dynamic> data) =>
      ForbiddenException(message: 'Forbidden error');
}

class ConflictException implements Exception {
  final String message;

  ConflictException({required this.message});

  factory ConflictException.withErrorCode(Map<String, dynamic> data) =>
      ConflictException(message: 'Conflict error');
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException({required this.message});

  factory NotFoundException.withErrorCode(dynamic data) =>
      NotFoundException(message: 'Not found error');
}

class InternalServerException implements Exception {
  final String message;

  InternalServerException({required this.message});
}

// any
class AuthException implements Exception {}

class StorageException implements Exception {}

class NoInternetConnectionException implements Exception {}

class TooManyRequestsException implements Exception {}