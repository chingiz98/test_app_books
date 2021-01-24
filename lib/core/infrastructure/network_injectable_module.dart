import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testapp/core/infrastructure/interceptors/dio_auth_interceptor.dart';

@module
abstract class NetworkInjectableModule {
  @LazySingleton(env: [Environment.dev, Environment.test, Environment.prod])
  Dio dio({
    @required DioAuthInterceptor authInterceptor,
  }) {
    final dio = Dio(BaseOptions(baseUrl: 'https://mobile.fakebook.press/'));
    return dio
      ..interceptors.addAll([
        authInterceptor..dio = dio,
      ]);
  }
}
