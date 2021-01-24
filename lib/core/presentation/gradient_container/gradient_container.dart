import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    Key key,
    this.child,
    this.color,
    this.padding,
    this.height,
    this.width,
    this.alignment,
    this.margin,
    this.decoration,
  }) : super(key: key);

  final Widget child;

  final Color color;

  final EdgeInsetsGeometry padding;

  final double height;

  final double width;

  final AlignmentGeometry alignment;

  final EdgeInsetsGeometry margin;

  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      color: color,
      padding: padding,
      height: height,
      width: width,
      decoration: decoration ??
          const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                CustomColors.beginGradientThemeColor,
                CustomColors.endGradientThemeColor
              ],
            ),
          ),
      child: child,
    );
  }
}
