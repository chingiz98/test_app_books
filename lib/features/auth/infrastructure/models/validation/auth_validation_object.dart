import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:testapp/features/auth/infrastructure/models/validation/auth_validation_failure.dart';

@immutable
abstract class AuthValidationObject<T> {
  const AuthValidationObject();

  @override
  int get hashCode => value.hashCode;

  Either<AuthValidationFailure<T>, T> get value;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is AuthValidationObject<T> && o.value == value;
  }

  @override
  String toString() => 'Value($value)';
}
