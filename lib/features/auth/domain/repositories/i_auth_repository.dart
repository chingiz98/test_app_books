import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';

abstract class IAuthRepository {
  Future<Either<AppError, User>> signIn({
    @required String email,
    @required String password,
  });

  Future<Either<AppError, User>> signUp({
    @required String name,
    @required String email,
    @required String password,
  });

  Future<Either<AppError, void>> logout();
}
