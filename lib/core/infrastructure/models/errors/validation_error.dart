import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';

part 'validation_error.freezed.dart';

@freezed
abstract class ValidationError with _$ValidationError {
  const factory ValidationError.fieldEmpty() = ValidationEmailEmpty;

  const factory ValidationError.passwordsNotEqual() =
      ValidationPasswordsNotEqual;
}

extension ValidationErrorX on ValidationError {
  String toLocale(BuildContext context) {
    return map(
      fieldEmpty: (error) => context.l10n.fieldCanNotBeEmpty,
      passwordsNotEqual: (error) => context.l10n.passwordsNotEqual,
    );
  }
}
