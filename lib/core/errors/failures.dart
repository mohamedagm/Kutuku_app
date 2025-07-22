import 'dart:io';
import 'package:dio/dio.dart';

class Failures {
  final String errMessage;
  Failures(this.errMessage);
}

class DioLoginExceptions extends Failures {
  DioLoginExceptions(super.errMessage);

  factory DioLoginExceptions.fromDioError(DioException dioError) {
    final statusCode = dioError.response?.statusCode ?? 0;

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return DioLoginExceptions("Connection timeout. Please try again.");
      case DioExceptionType.sendTimeout:
        return DioLoginExceptions("Send timeout. Please try again.");
      case DioExceptionType.receiveTimeout:
        return DioLoginExceptions("Receive timeout. Please try again.");
      case DioExceptionType.badCertificate:
        return DioLoginExceptions(
          "Bad certificate. Please check your connection.",
        );
      case DioExceptionType.connectionError:
        return DioLoginExceptions(
          "Connection error. Please check your internet.",
        );
      case DioExceptionType.cancel:
        return DioLoginExceptions("Request was cancelled.");
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return DioLoginExceptions("No Internet connection.");
        }
        return DioLoginExceptions("Unexpected login error occurred.");
      case DioExceptionType.badResponse:
        switch (statusCode) {
          case 400:
            return DioLoginExceptions("Invalid credentials.");
          case 401:
            return DioLoginExceptions("Unauthorized. Please check your login.");
          case 500:
            return DioLoginExceptions("Server error. Please try again.");
          default:
            return DioLoginExceptions("Login failed. Status code: $statusCode");
        }
    }
  }
}

class DioProductsExceptions extends Failures {
  DioProductsExceptions(super.errMessage);

  factory DioProductsExceptions.fromDioError(DioException dioError) {
    final statusCode = dioError.response?.statusCode ?? 0;

    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return DioProductsExceptions("Connection timeout. Please try again.");
      case DioExceptionType.sendTimeout:
        return DioProductsExceptions("Send timeout. Please try again.");
      case DioExceptionType.receiveTimeout:
        return DioProductsExceptions("Receive timeout. Please try again.");
      case DioExceptionType.badCertificate:
        return DioProductsExceptions(
          "Bad certificate. Please check your connection.",
        );
      case DioExceptionType.connectionError:
        return DioProductsExceptions(
          "Connection error. Please check your internet.",
        );
      case DioExceptionType.cancel:
        return DioProductsExceptions("Request was cancelled.");
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          return DioProductsExceptions("No Internet connection.");
        }
        return DioProductsExceptions("Unexpected product error occurred.");
      case DioExceptionType.badResponse:
        switch (statusCode) {
          case 400:
            return DioProductsExceptions(
              "Bad request. Please check filters or query.",
            );
          case 404:
            return DioProductsExceptions("Products not found.");
          case 500:
            return DioProductsExceptions("Server error. Please try again.");
          default:
            return DioProductsExceptions(
              "Product request failed. Status code: $statusCode",
            );
        }
    }
  }
}
