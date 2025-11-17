part of 'rest_api_client.dart';

enum ErrorResponseType {
  connectTimeout,
  sendTimeout,
  receiveTimeout,
  cancel,
  response,
  connectionError,
  invalidToken,
  noInternetConnection,
  serverNotAvailable,
  other,
}

class ErrorResponse {
  ErrorResponse({this.errorCode, this.message, this.error, this.errorType});

  ErrorResponse.fromJson(dynamic json) {
    errorCode = json['errorCode'];
    message = json['message'];
    error = json['data'];
  }

  ErrorResponseType? errorType;
  int? errorCode;
  String? message;
  dynamic error;

  ErrorResponse copyWith({int? errorCode, String? message, dynamic error, ErrorResponseType? type}) =>
      ErrorResponse(
        errorType: type,
        errorCode: errorCode ?? this.errorCode,
        message: message ?? this.message,
        error: error ?? this.error,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorCode'] = errorCode;
    map['message'] = message;
    map['error'] = error;
    return map;
  }
}

@lazySingleton
class CustomErrorHandler {
  const CustomErrorHandler();

  ErrorResponse getErrorMessage(dynamic exception, {int? errorCode}) {
    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.cancel:
          return ErrorResponse(
            message: EN.requestCancelled,
            errorType: ErrorResponseType.cancel,
            errorCode: errorCode,
          );

        case DioExceptionType.connectionTimeout:
          return ErrorResponse(
            message: EN.connectionTimeout,
            errorType: ErrorResponseType.connectTimeout,
            errorCode: errorCode,
          );

        case DioExceptionType.unknown:
          return ErrorResponse(
            message: EN.noInternetConnection,
            errorType: ErrorResponseType.noInternetConnection,
            errorCode: errorCode,
          );

        case DioExceptionType.connectionError:
          return ErrorResponse(
            message: EN.connectionError,
            errorType: ErrorResponseType.connectionError,
            errorCode: errorCode,
          );

        case DioExceptionType.receiveTimeout:
          return ErrorResponse(
            message: EN.requestTimeOutConnection,
            errorType: ErrorResponseType.receiveTimeout,
            errorCode: errorCode,
          );
        case DioExceptionType.badResponse:
          return ErrorResponse(
            message: '${EN.receivedInvalidStatus} ${exception.response!.statusCode}',
            errorType: ErrorResponseType.response,
            errorCode: errorCode,
          );
        case DioExceptionType.sendTimeout:
          return ErrorResponse(
            message: EN.connectionTimeout,
            errorType: ErrorResponseType.sendTimeout,
            errorCode: errorCode,
          );
        default:
          return ErrorResponse(
            message: '${EN.somethingWentWrong} (${exception.type})',
            errorType: ErrorResponseType.other,
            errorCode: errorCode,
          );
      }
    } else {
      return ErrorResponse(message: exception.toString(), errorType: ErrorResponseType.other);
    }
  }
}
