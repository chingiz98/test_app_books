import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';

enum InlineIndicatorButtonStyle {
  whiteOpacity18Color,
  accentViolet,
  grey,
}

extension InlineIndicatorButtonStyleExtension on InlineIndicatorButtonStyle {
  bool get isAccentViolet => this == InlineIndicatorButtonStyle.accentViolet;

  bool get isWhiteOpacity18Color =>
      this == InlineIndicatorButtonStyle.whiteOpacity18Color;

  bool get isGrey => this == InlineIndicatorButtonStyle.grey;

  Color get color {
    if (isWhiteOpacity18Color) {
      return CustomColors.whiteOpacity18Color;
    } else if (isAccentViolet) {
      return CustomColors.accentViolet;
    } else {
      return CustomColors.greyText.withOpacity(0.18);
    }
  }
}
