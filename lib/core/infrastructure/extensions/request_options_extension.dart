import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

extension RequestOptionsX on RequestOptions {
  bool get isRefreshTokenPath => path?.contains('/auth/refresh') ?? false;

  RequestOptions withHeaders({@required String authorization}) {
    return this..headers['Authorization'] = 'Bearer $authorization';
  }

  String get authorization => headers['Authorization'] as String;
}
