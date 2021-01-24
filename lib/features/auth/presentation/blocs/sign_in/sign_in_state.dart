part of 'sign_in_bloc.dart';

@freezed
abstract class SignInState with _$SignInState {
  const SignInState._();

  const factory SignInState.initial({
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
  }) = SignInInitial;

  const factory SignInState.inProgress({
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
  }) = SignInInProgress;

  const factory SignInState.success({
    @required User user,
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
  }) = SignInSuccess;

  const factory SignInState.failure({
    @required AppError error,
    @required TextEditingController emailController,
    @required TextEditingController passwordController,
  }) = SignInFailure;
}
