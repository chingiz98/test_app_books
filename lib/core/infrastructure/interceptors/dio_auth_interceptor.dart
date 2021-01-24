import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:testapp/core/infrastructure/extensions/request_options_extension.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/auth/domain/providers/i_auth_storage_provider.dart';

@lazySingleton
class DioAuthInterceptor extends Interceptor {
  DioAuthInterceptor(
    this._authStorage,
  );

  final IAuthStorageProvider _authStorage;

  final _authFailureController = StreamController<AppError>();

  Stream<AppError> get failures => _authFailureController.stream;

  Dio dio;

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    return _writeAuthorizationHeader(options);
  }

  @override
  Future onError(DioError error) async {
    //TODO: здесь нужно обработать протухший токен
    print(error);
  }

  Future onRefreshSuccess(RequestOptions options) async {
    unlockInterceptors();
    return _request(options);
  }

  Future<RequestOptions> _writeAuthorizationHeader(
    RequestOptions options,
  ) async {
    final authorization = await _authStorage.readAuthorizationToken();
    return authorization.fold(
      (failure) => options,
      (token) => options.withHeaders(
        authorization: token,
      ),
    );
  }

  Future _request(RequestOptions options) {
    return dio?.request<dynamic>(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      cancelToken: options.cancelToken,
      options: options,
      onSendProgress: options.onSendProgress,
      onReceiveProgress: options.onReceiveProgress,
    );
  }

  void lockInterceptors() {
    if (dio != null) {
      dio.lock();
      dio.interceptors.requestLock.lock();
      dio.interceptors.responseLock.lock();
      dio.interceptors.errorLock.lock();
      log('Dio locked');
    }
  }

  void unlockInterceptors() {
    if (dio != null) {
      dio.unlock();
      dio.interceptors.requestLock.unlock();
      dio.interceptors.responseLock.unlock();
      dio.interceptors.errorLock.unlock();
      log('Dio unlocked');
    }
  }

  void clearInterceptorsQueue() {
    if (dio != null) {
      dio.clear();
      dio.interceptors.requestLock.clear();
      dio.interceptors.responseLock.clear();
      dio.interceptors.errorLock.clear();
      log('Dio cleared');
    }
  }

  void log(String text) => Logger.root.info('[DioAuthInterceptor]: $text');
}
