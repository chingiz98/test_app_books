import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';

part 'authorization_error.freezed.dart';

@freezed
abstract class AuthorizationError with _$AuthorizationError {
  const factory AuthorizationError.unauthorized() = UnauthorizedError;
}

extension AuthorizationErrorX on AuthorizationError {
  String toLocale(BuildContext context) {
    return map(
      unauthorized: (error) => context.l10n.unauthorizedError,
    );
  }
}
