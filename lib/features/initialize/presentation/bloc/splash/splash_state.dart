part of 'splash_bloc.dart';

@freezed
abstract class SplashState implements _$SplashState {
  const SplashState._();

  const factory SplashState.initial() = SplashInitial;

  const factory SplashState.inProgress() = SplashInProgress;

  const factory SplashState.success({
    @required User user,
  }) = SplashSuccess;

  const factory SplashState.failure({
    @required AppError error,
  }) = SplashFailure;

  SplashType get completedType {
    // TODO(ChingizFatikhov): Добавить типы начальных экранов
    /*
    if (onBoardingState is OnboardingInProgress) {
      return SplashOutType.onBoarding;
    }
    if (authState is AuthUnauthenticated) {
      return SplashOutType.auth;
    }
    if (navigationState is NavigationSplashSuccess) {
      return SplashOutType.app;
    }

     */

    return SplashType.auth;
  }
}
