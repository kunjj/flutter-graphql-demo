part of 'rest_api_client.dart';

class ApiResponse<T> {
  const ApiResponse(this.data, this.errorResponse);

  factory ApiResponse.success(T data) => ApiResponse(data, null);

  factory ApiResponse.failure(ErrorResponse errorResponse) => ApiResponse(null, errorResponse);

  final T? data;
  final ErrorResponse? errorResponse;
}

extension ResponseEntityUtil on ApiResponse<dynamic> {
  bool get isSuccess => errorResponse == null;
}

abstract class PaginatedData<T> {
  int get offset;

  int get limit;

  int get total;

  int get count;

  List<T> get results;
}
