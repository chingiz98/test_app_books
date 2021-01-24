import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/infrastructure/models/errors/authorization_error.dart';
import 'package:testapp/core/infrastructure/models/errors/validation_error.dart';

part 'app_error.freezed.dart';

@freezed
abstract class AppError with _$AppError {
  const AppError._();

  const factory AppError.unknown({
    @required String message,
  }) = AppUnknownError;

  factory AppError.fromException(dynamic e) {
    if (e is AppError) {
      return e;
    }
    return AppError.unknown(message: e.toString());
  }

  const factory AppError.validation({
    @required ValidationError failure,
  }) = AppValidationError;

  const factory AppError.authorization({
    @required AuthorizationError failure,
  }) = AppAuthorizationError;

  String toLocale(BuildContext context) {
    return map(
      unknown: (s) => context.l10n.unknownError,
      validation: (s) => s.failure.toLocale(context),
      authorization: (s) => s.failure.toLocale(context),
    );
  }

  bool get isAuthorization => this is AppAuthorizationError;

  bool get isValidation => this is AppValidationError;

  bool get isUnknown => this is AppUnknownError;
}
