import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_validation_failure.freezed.dart';

@freezed
abstract class AuthValidationFailure<T> with _$AuthValidationFailure<T> {
  const factory AuthValidationFailure.invalidEmail({
    T failedValue,
  }) = InvalidEmail<T>;

  const factory AuthValidationFailure.shortPassword({
    T failedValue,
  }) = ShortPassword<T>;

  const factory AuthValidationFailure.mismatchPassword({
    T failedValue,
  }) = MismatchPassword<T>;

  const factory AuthValidationFailure.invalidPhoneNumber({
    T failedValue,
  }) = InvalidPhoneNumber<T>;

  const factory AuthValidationFailure.invalidBirthDate({
    T failedValue,
  }) = InvalidBirthDate<T>;

  const factory AuthValidationFailure.invalidTagList({
    T failedValue,
  }) = InvalidTagList<T>;

  const factory AuthValidationFailure.empty({
    T failedValue,
  }) = Empty<T>;
}
