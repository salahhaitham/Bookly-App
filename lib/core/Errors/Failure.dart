
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);

  factory ServerFailure.fromDio(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return ServerFailure("Connection Timeout");

      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode ?? 0;
        if (statusCode == 404) {
          return ServerFailure("Not Found (404)");
        } else if (statusCode == 500) {
          return ServerFailure("Internal Server Error (500)");
        } else {
          return ServerFailure("Bad Response: $statusCode");
        }

      case DioExceptionType.cancel:
        return ServerFailure("Request Cancelled");

      case DioExceptionType.unknown:
        return ServerFailure("No Internet Connection");

      default:
        return ServerFailure("Unexpected Dio Error");
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure([String message = "Cache Failure"]) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure([String message = "No Internet Connection"]) : super(message);
}

class UnknownFailure extends Failure {
  UnknownFailure([String message = "Unknown Error"]) : super(message);
}
