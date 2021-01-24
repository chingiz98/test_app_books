import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testapp/core/presentation/icons/custom_icon_data.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
    this.icon, {
    Key key,
    this.color,
    this.filled = true,
    this.semanticLabel,
    this.size,
  }) : super(key: key);

  final CustomIconData icon;
  final double size;
  final Color color;
  final bool filled;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final iconSize = size ?? iconTheme.size;

    if (icon == null) {
      return Semantics(
        label: semanticLabel,
        child: SizedBox(width: iconSize, height: iconSize),
      );
    }

    Color iconColor;
    if (filled) {
      final iconOpacity = iconTheme.opacity;
      iconColor = color ?? iconTheme.color;
      if (iconOpacity != 1.0) {
        iconColor = iconColor.withOpacity(iconColor.opacity * iconOpacity);
      }
    }

    final Widget iconWidget = SvgPicture.asset(
      icon.assetPath,
      color: iconColor,
      semanticsLabel: semanticLabel,
      width: iconSize,
      height: iconSize,
    );

    return Semantics(
      label: semanticLabel,
      child: ExcludeSemantics(
        child: SizedBox(
          width: iconSize,
          height: iconSize,
          child: Center(
            child: iconWidget,
          ),
        ),
      ),
    );
  }
}