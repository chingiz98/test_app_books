import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

enum WideActionButtonStyle {
  gradient,
  white,
  transparentWhite,
  transparentAccentViolet
}

extension WideActionButtonStyleExtension on WideActionButtonStyle {
  bool get isGradient => this == WideActionButtonStyle.gradient;

  bool get isWhite => this == WideActionButtonStyle.white;

  bool get isTransparentAccentViolet =>
      this == WideActionButtonStyle.transparentAccentViolet;

  bool get isTransparentWhite => this == WideActionButtonStyle.transparentWhite;

  double get elevation => (isGradient || isWhite) ? 10.0 : 0;

  Decoration get decoration => isWhite
      ? CustomTheme.whiteButtonTheme
      : isGradient
          ? CustomTheme.gradientButtonTheme
          : isTransparentWhite
              ? CustomTheme.transparentWhiteButtonTheme
              : CustomTheme.transparentAccentVioletButtonTheme;

  TextStyle get textStyle => isWhite
      ? CustomTheme.textAccentViolet16Ubuntu700
      : isGradient
          ? CustomTheme.textWhite16Ubuntu700
          : isTransparentWhite
              ? CustomTheme.textWhite16Ubuntu500
              : CustomTheme.textAccentViolet16Ubuntu500;
}
