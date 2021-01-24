import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';
import 'package:testapp/core/domain/services/i_logger_service.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/auth/domain/providers/i_auth_storage_provider.dart';
import 'package:testapp/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:testapp/features/auth/domain/services/i_auth_service.dart';
import 'package:testapp/features/auth/infrastructure/models/requests/sign_in_request.dart';
import 'package:testapp/features/auth/infrastructure/models/requests/sign_up_request.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository(
    this._authService,
    this._authStorageProvider,
  ) : _log = getIt<ILoggerService>().create('AuthRepository');

  final IAuthService _authService;
  final IAuthStorageProvider _authStorageProvider;
  final Logger _log;

  @override
  Future<Either<AppError, User>> signIn({
    @required String email,
    @required String password,
  }) async {
    try {
      final signInResult = await _authService.signIn(
        request: SignInRequest(
          email: email,
          password: password,
          password_confirmation: password,
        ),
      );

      final tokenWriteResult = await _authStorageProvider
          .writeAuthorizationToken(token: signInResult.token);

      if (tokenWriteResult.isLeft()) {
        return Left(tokenWriteResult.swap() | null);
      }

      final userInfoResult = await _authService.getUserInfo();

      return Right(
        User(
          id: userInfoResult.id.toString(),
          email: userInfoResult.email,
          firstName: userInfoResult.name,
        ),
      );
    } catch (e, s) {
      _log.shout('signIn', e, s);
      return Left(AppError.fromException(e));
    }
  }

  @override
  Future<Either<AppError, User>> signUp({
    @required String name,
    @required String email,
    @required String password,
  }) async {
    try {
      final signUpResult = await _authService.signUp(
        request: SignUpRequest(
          name: name,
          email: email,
          password: password,
          password_confirmation: password,
        ),
      );

      final signInResult = await _authService.signIn(
        request: SignInRequest(
          email: email,
          password: password,
          password_confirmation: password,
        ),
      );

      final tokenWriteResult = await _authStorageProvider
          .writeAuthorizationToken(token: signInResult.token);

      if (tokenWriteResult.isLeft()) {
        return Left(tokenWriteResult.swap() | null);
      }

      final userInfoResult = await _authService.getUserInfo();

      return Right(
        User(
          id: userInfoResult.id.toString(),
          email: userInfoResult.email,
          firstName: userInfoResult.name,
        ),
      );
    } catch (e, s) {
      _log.shout('signUp', e, s);
      return Left(AppError.fromException(e));
    }
  }

  @override
  Future<Either<AppError, void>> logout() async {
    try {
      final result = await _authService.logout();
      await _authStorageProvider.deleteAuthorizationToken();
      return Right(result);
    } catch (e, s) {
      _log.shout('logout', e, s);
      return Left(AppError.fromException(e));
    }
  }
}
