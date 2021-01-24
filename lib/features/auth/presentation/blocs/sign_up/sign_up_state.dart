part of 'sign_up_bloc.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const SignUpState._();

  const factory SignUpState.initial({
    @required TextEditingController nameController,
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required TextEditingController passwordConfirmController,
  }) = SignUpInitial;

  const factory SignUpState.inProgress({
    @required TextEditingController nameController,
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required TextEditingController passwordConfirmController,
  }) = SignUpInProgress;

  const factory SignUpState.success({
    @required User user,
    @required TextEditingController nameController,
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required TextEditingController passwordConfirmController,
  }) = SignUpSuccess;

  const factory SignUpState.failure({
    @required AppError error,
    @required TextEditingController nameController,
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
    @required TextEditingController passwordConfirmController,
  }) = SignUpFailure;
}
