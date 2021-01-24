part of 'splash_bloc.dart';

@freezed
abstract class SplashEvent with _$SplashEvent {
  const factory SplashEvent.started({
    @required Duration duration,
  }) = SplashStarted;

  const factory SplashEvent.userAuthorized({
    @required User user,
  }) = SplashUserAuthorized;

  const factory SplashEvent.userUnauthorized() = SplashUserUnauthorized;
}
