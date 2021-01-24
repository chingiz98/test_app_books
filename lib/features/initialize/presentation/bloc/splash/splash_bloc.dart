import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/core/infrastructure/models/errors/authorization_error.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:testapp/features/settings/domain/repositories/i_user_repository.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';

part 'splash_bloc.freezed.dart';

part 'splash_event.dart';

part 'splash_state.dart';

enum SplashType {
  onBoarding,
  auth,
  app,
}

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this._authRepository,
    this._userRepository,
  )   : assert(_authRepository != null),
        super(const SplashInitial());

  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    yield* event.map(
      started: _mapStartedToState,
      userAuthorized: _mapAuthorizedToState,
      userUnauthorized: _mapUnauthorizedToState,
    );
  }

  Stream<SplashState> _mapStartedToState(
    SplashStarted event,
  ) async* {
    yield const SplashInProgress();

    final currentUser = await _userRepository.getCurrentUser();

    await Future<void>.delayed(event.duration);

    yield* currentUser.fold(
      (_) async* {
        yield const SplashFailure(
          error: AppError.authorization(
            failure: UnauthorizedError(),
          ),
        );
      },
      (user) async* {
        yield SplashSuccess(user: user);
      },
    );
  }

  Stream<SplashState> _mapAuthorizedToState(
    SplashUserAuthorized event,
  ) async* {
    yield SplashSuccess(user: event.user);
  }

  Stream<SplashState> _mapUnauthorizedToState(
    SplashUserUnauthorized event,
  ) async* {
    final result = await _authRepository.logout();
    yield result.fold(
      (error) => SplashFailure(error: error),
      (_) => const SplashFailure(
        error: AppError.authorization(
          failure: UnauthorizedError(),
        ),
      ),
    );
  }
}

extension SplashBlocBuildContextX on BuildContext {
  SplashBloc get splashBloc => BlocProvider.of<SplashBloc>(this);
}
