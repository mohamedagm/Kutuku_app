import 'dart:io';
import 'package:dio/dio.dart';

class Failures {
  final String errMessage;
  Failures(this.errMessage);
}

class DioExceptions extends Failures {
  DioExceptions(super.errMessage);
  factory DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return DioExceptions("Connection timeout. Please try again.");
      case DioExceptionType.sendTimeout:
        return DioExceptions("Send timeout. Please try again.");
      case DioExceptionType.receiveTimeout:
        return DioExceptions("Receive timeout. Please try again.");
      case DioExceptionType.badCertificate:
        return DioExceptions("Bad certificate. Please check your connection.");
      case DioExceptionType.badResponse:
        final statusCode = dioError.response?.statusCode ?? 0;
        if (statusCode == 400) {
          return DioExceptions("Invalid credentials.");
        } else if (statusCode == 401) {
          return DioExceptions("Unauthorized. Please check your login.");
        } else if (statusCode == 404) {
          return DioExceptions("Not found. Please try again later.");
        } else if (statusCode == 500) {
          return DioExceptions("Server error. Please try again later.");
        } else {
          return DioExceptions("Received invalid status code: $statusCode");
        }
      case DioExceptionType.cancel:
        return DioExceptions("Request was cancelled.");
      case DioExceptionType.connectionError:
        return DioExceptions("Connection error. Please check your internet.");
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return DioExceptions("No Internet connection.");
        }
        return DioExceptions("Unexpected error occurred. Please try again.");
    }
  }
}
