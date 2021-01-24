import 'package:dartz/dartz.dart';
import 'package:testapp/features/auth/infrastructure/models/validation/auth_validation_failure.dart';
import 'package:testapp/features/auth/infrastructure/models/validation/auth_validation_object.dart';

class Password extends AuthValidationObject<String> {
  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);

  @override
  final Either<AuthValidationFailure<String>, String> value;
}

Either<AuthValidationFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(AuthValidationFailure.shortPassword(failedValue: input));
  }
}
