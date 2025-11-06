import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_demo_app/dio_link.dart';
import 'package:graphql_demo_app/service_locator.config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

final GetIt _getIt = GetIt.instance;

@InjectableInit(throwOnMissingDependencies: true, preferRelativeImports: true)
Future<void> serviceLocatorSetup() async => _getIt.init();

T get<T extends Object>() => _getIt<T>();

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  @lazySingleton
  DioLink dioLink(Dio dio) =>
      DioLink('https://countries.trevorblades.com/', dio);
}

@module
abstract class GraphQLModule {
  @lazySingleton
  GraphQLClient graphQLClient(DioLink dioLink) => GraphQLClient(
    link: dioLink,
    cache: GraphQLCache(store: HiveStore()),
  );
}
