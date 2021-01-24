import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

class CountMessages extends StatelessWidget {
  const CountMessages({
    Key key,
    @required this.title,
    this.countMessagesRadius = 9,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
    this.backgroundImage,
    this.onBackgroundImageError,
    this.radius,
    this.minRadius,
    this.maxRadius,
    this.internalPadding,
  })  : assert(title != null && title != ''),
        assert(radius == null || (minRadius == null && maxRadius == null)),
        assert(backgroundImage != null || onBackgroundImageError == null),
        super(key: key);

  final Widget child;

  final Color backgroundColor;

  final Color foregroundColor;

  final ImageProvider backgroundImage;

  final ImageErrorListener onBackgroundImageError;

  final double radius;

  final double minRadius;

  final double maxRadius;

  final EdgeInsetsGeometry internalPadding;

  final String title;

  final double countMessagesRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: maxRadius,
      minRadius: minRadius,
      onBackgroundImageError: onBackgroundImageError,
      foregroundColor: foregroundColor,
      backgroundImage: backgroundImage,
      backgroundColor: CustomColors.accentOrange,
      radius: countMessagesRadius,
      child: child ??
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: internalPadding ?? const EdgeInsets.all(3.0),
              child: Text(
                title,
                style: CustomTheme.textAccentRed14SourceSansPro600,
              ),
            ),
          ),
    );
  }
}
