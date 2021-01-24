import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/core/infrastructure/models/errors/validation_error.dart';
import 'package:testapp/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:testapp/features/auth/infrastructure/validators/auth_validators.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';

part 'sign_in_bloc.freezed.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(
    this._authRepository,
  )   : assert(_authRepository != null),
        super(
          SignInInitial(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
          ),
        );

  final IAuthRepository _authRepository;

  @override
  Future<void> close() {
    state.emailController.dispose();
    state.passwordController.dispose();
    return super.close();
  }

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    yield* event.map(
      signedIn: _signedInToState,
    );
  }

  Stream<SignInState> _signedInToState(SignedIn event) async* {
    yield SignInInProgress(
      emailController: state.emailController,
      passwordController: state.passwordController,
    );

    if (EmailAddress(event.email).value.isRight() &&
        Password(event.password).value.isRight()) {
      final result = await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      yield* result.fold(
        (error) async* {
          yield SignInFailure(
            emailController: state.emailController,
            passwordController: state.passwordController,
            error: error,
          );
        },
        (user) async* {
          yield SignInSuccess(
            user: user,
            emailController: state.emailController,
            passwordController: state.passwordController,
          );
        },
      );
    } else {
      yield SignInFailure(
        error: const AppError.validation(
          failure: ValidationError.fieldEmpty(),
        ),
        emailController: state.emailController,
        passwordController: state.passwordController,
      );
    }
  }

}

extension SignInBlocBuildContextX on BuildContext {
  SignInBloc get signInBloc => BlocProvider.of<SignInBloc>(this);
}
