part of 'sign_up_bloc.dart';

@freezed
abstract class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.signedUp({
    @required String name,
    @required String email,
    @required String password,
    @required String passwordConfirm,
  }) = SignedUp;
}
