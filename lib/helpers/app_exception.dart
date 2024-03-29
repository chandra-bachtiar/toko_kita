class AppException implements Exception {
  final String? message;
  final String? prefix;

  AppException([this.message, this.prefix]);

  // ignore: annotate_overrides
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message!, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message!, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message]) : super(message!, "Unauthorised: ");
}

class UnprocesableEntityException extends AppException {
  UnprocesableEntityException([String? message])
      : super(message!, "Unprocesable Entity: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message!, "Invalid Input: ");
}
