import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';

abstract class IAuthStorageProvider {
  Future<Either<AppError, String>> readAuthorizationToken();

  Future<Either<AppError, Unit>> writeAuthorizationToken({
    @required String token,
  });

  Future<Either<AppError, Unit>> deleteAuthorizationToken();
}
