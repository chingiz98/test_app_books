import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:testapp/core/infrastructure/extensions/enum_extension.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/core/infrastructure/providers/secure_storage_base_provider.dart';
import 'package:testapp/features/auth/domain/providers/i_auth_storage_provider.dart';

enum _AuthStorageKey {
  token,
}

@Singleton(as: IAuthStorageProvider)
class AuthStorageProvider extends SecureStorageBaseProvider
    implements IAuthStorageProvider {
  const AuthStorageProvider(
    FlutterSecureStorage secureStorage,
  )   : assert(secureStorage != null),
        super(secureStorage);

  @override
  Future<Either<AppError, String>> readAuthorizationToken() async {
    final result = await read(key: _AuthStorageKey.token.key);
    return result.fold(
      (failure) => Left(failure),
      (value) => Right(value),
    );
  }

  @override
  Future<Either<AppError, Unit>> writeAuthorizationToken({
    @required String token,
  }) {
    return write(
      key: _AuthStorageKey.token.key,
      value: token,
    );
  }

  @override
  Future<Either<AppError, Unit>> deleteAuthorizationToken() {
    return delete(
      key: _AuthStorageKey.token.key,
    );
  }
}
