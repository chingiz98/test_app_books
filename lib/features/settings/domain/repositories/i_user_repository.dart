import 'package:dartz/dartz.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';

abstract class IUserRepository {
  Future<Either<AppError, User>> getCurrentUser();
}
