import 'package:dio/dio.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

import '../core/logging.dart';
import 'network_info.dart';

part 'error_response.dart';
part 'response.dart';

enum GraphQLOperationType { query, mutation, subscription }

@lazySingleton
class GraphQLApiClient {
  GraphQLApiClient(this._graphQLClient, this._customErrorHandler, this._networkInfo);

  final GraphQLClient _graphQLClient;
  final DioErrorHandler _customErrorHandler;
  final NetworkInfo _networkInfo;

  // final Set<String> _retriedRequests = {};

  Future<ApiResponse<T>> request<T>({
    required String query,
    required GraphQLOperationType type,
    Map<String, dynamic>? variables,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    if (!await _networkInfo.isConnected) {
      return Error(
        errorResponse: ErrorResponse(message: 'No Internet Connection', errorType: ErrorResponseType.noInternetConnection),
      );
    }
    try {} on DioException catch (error) {
      return Error(errorResponse: _customErrorHandler.getErrorMessage(error, errorCode: error.response?.statusCode));
    } on Exception catch (error) {
      printLog(error: error);
      return Error(
        errorResponse: ErrorResponse(message: error.toString(), errorType: ErrorResponseType.other),
      );
    }
  }

  // Map<String, dynamic>? _getMapFromString(data) {
  //   if (data is String) {
  //     final res = jsonDecode(data);
  //     if (res is List) {
  //       return {'data': res};
  //     } else if (res is bool || res is num || res is String) {
  //       return {'status': res};
  //     } else {
  //       return jsonDecode(data);
  //     }
  //   } else {
  //     return data;
  //   }
  // }

  Dio get dio => _graphQLClient;
}
