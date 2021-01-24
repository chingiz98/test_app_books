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

part 'sign_up_bloc.freezed.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(
    this._authRepository,
  )   : assert(_authRepository != null),
        super(
          SignUpInitial(
            nameController: TextEditingController(),
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            passwordConfirmController: TextEditingController(),
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
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    yield* event.map(
      signedUp: _signedUpToState,
    );
  }

  Stream<SignUpState> _signedUpToState(SignedUp event) async* {
    yield SignUpInProgress(
      nameController: state.nameController,
      emailController: state.emailController,
      passwordController: state.passwordController,
      passwordConfirmController: state.passwordConfirmController,
    );

    if (EmailAddress(event.email).value.isRight() &&
        Password(event.password).value.isRight() &&
        event.password == event.passwordConfirm) {
      final result = await _authRepository.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      yield* result.fold(
        (error) async* {
          yield SignUpFailure(
            nameController: state.nameController,
            emailController: state.emailController,
            passwordController: state.passwordController,
            passwordConfirmController: state.passwordConfirmController,
            error: error,
          );
        },
        (user) async* {
          yield result.fold(
            (error) => SignUpFailure(
              error: error,
              nameController: state.nameController,
              emailController: state.emailController,
              passwordController: state.passwordController,
              passwordConfirmController: state.passwordConfirmController,
            ),
            (user) => SignUpSuccess(
              user: user,
              nameController: state.nameController,
              emailController: state.emailController,
              passwordController: state.passwordController,
              passwordConfirmController: state.passwordConfirmController,
            ),
          );
        },
      );
    } else {
      yield SignUpFailure(
        error: const AppError.validation(
          failure: ValidationError.fieldEmpty(),
        ),
        nameController: state.nameController,
        emailController: state.emailController,
        passwordController: state.passwordController,
        passwordConfirmController: state.passwordConfirmController,
      );
    }
  }
}

extension SignUpBlocBuildContextX on BuildContext {
  SignUpBloc get signUpBloc => BlocProvider.of<SignUpBloc>(this);
}
