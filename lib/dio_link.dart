import 'package:dio/dio.dart' as dio;
import 'package:gql/language.dart';
import 'package:gql_exec/gql_exec.dart' as gql;
import 'package:graphql_flutter/graphql_flutter.dart';

enum QueryType { query, mutation, subscription }

/// Custom GraphQL link that uses Dio instead of HttpLink
class DioLink extends Link {
  final dio.Dio _dio;
  final String endpoint;

  DioLink(this.endpoint, this._dio);

  @override
  Stream<gql.Response> request(
    gql.Request request, [
    NextLink? forward,
  ]) async* {
    try {
      final response = await _dio.post(
        endpoint,
        data: {
          'query': printNode(request.operation.document),
          'variables': request.variables,
        },
        options: dio.Options(
          headers: {
            'Content-Type': 'application/json',
            ...?request.context.entry<HttpLinkHeaders>()?.headers,
          },
        ),
      );

      final responseData = response.data;

      yield gql.Response(
        data: responseData['data'],
        response: responseData,
        context: gql.Context(),
      );
    } on dio.DioException catch (e) {
      yield gql.Response(
        data: null,
        response: {
          'errors': [
            {'message': e.message ?? 'Unknown Dio error'},
          ],
        },
        context: gql.Context(),
      );
    }
  }
}
