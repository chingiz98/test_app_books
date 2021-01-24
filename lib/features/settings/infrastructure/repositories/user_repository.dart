import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:testapp/core/domain/services/i_logger_service.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/auth/domain/services/i_auth_service.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';
import 'package:testapp/features/settings/domain/repositories/i_user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  UserRepository(
    this._authService,
  ) : _log = getIt<ILoggerService>().create('UserRepository');

  final Logger _log;

  final IAuthService _authService;

  @override
  Future<Either<AppError, User>> getCurrentUser() async {
    try {
      final userInfoResult = await _authService.getUserInfo();

      return Right(
        User(
          id: userInfoResult.id.toString(),
          email: userInfoResult.email,
          firstName: userInfoResult.name,
        ),
      );
    } catch (e, s) {
      _log.shout('getUser', e, s);
      return Left(AppError.fromException(e));
    }
  }
}
