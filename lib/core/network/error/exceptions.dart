class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});

  factory ServerException.withErrorCode(Map<String, dynamic> data) =>
      ServerException(message: data['error'] ?? 'Server not responding');
}

class UnprocessableException implements Exception {
  final String message;

  UnprocessableException({required this.message});

  factory UnprocessableException.withErrorCode(Map<String, dynamic> data) =>
      UnprocessableException(message: data['error'] ?? 'Unprocessable error');
}

class ForbiddenException implements Exception {
  final String message;

  ForbiddenException({required this.message});

  factory ForbiddenException.withErrorCode(Map<String, dynamic> data) =>
      ForbiddenException(message: data['error'] ?? 'Forbidden error');
}

class ConflictException implements Exception {
  final String message;

  ConflictException({required this.message});

  factory ConflictException.withErrorCode(Map<String, dynamic> data) =>
      ConflictException(message: data['error'] ?? 'Conflict error');
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException({required this.message});

  factory NotFoundException.withErrorCode(dynamic data) =>
      NotFoundException(message: data['error'] ?? 'Not found error');
}

class InternalServerException implements Exception {
  final String message;

  InternalServerException({required this.message});
}

// other cases
class AuthException implements Exception {}

class StorageException implements Exception {}

class NoInternetConnectionException implements Exception {}

class TooManyRequestsException implements Exception {}
