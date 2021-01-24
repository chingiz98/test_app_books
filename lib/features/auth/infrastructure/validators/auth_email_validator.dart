import 'package:dartz/dartz.dart';
import 'package:testapp/features/auth/infrastructure/models/validation/auth_validation_failure.dart';
import 'package:testapp/features/auth/infrastructure/models/validation/auth_validation_object.dart';

class EmailAddress extends AuthValidationObject<String> {
  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);

  @override
  final Either<AuthValidationFailure<String>, String> value;
}

Either<AuthValidationFailure<String>, String> validateEmailAddress(
  String input,
) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(AuthValidationFailure.invalidEmail(failedValue: input));
  }
}
