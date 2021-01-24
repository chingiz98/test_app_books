import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/buttons/style_types/wide_action_button_style.dart';

class WideActionButton extends StatelessWidget {
  const WideActionButton({
    Key key,
    this.onTap,
    @required this.title,
    this.buttonStyle,
    this.onLongPress,
    this.onHighlightChanged,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.padding,
    this.visualDensity,
    this.shape,
    this.focusNode,
    this.materialTapTargetSize,
    this.child,
    this.height,
    this.minWidth,
    this.borderRadiusGeometry,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
  })  : assert(title != null && title != ''),
        assert(clipBehavior != null),
        assert(autofocus != null),
        super(key: key);

  final VoidCallback onTap;

  final WideActionButtonStyle buttonStyle;

  final String title;

  final VoidCallback onLongPress;

  final ValueChanged<bool> onHighlightChanged;

  final ButtonTextTheme textTheme;

  final Color textColor;

  final Color disabledTextColor;

  final Color color;

  final Color disabledColor;

  final Color focusColor;

  final Color hoverColor;

  final Color highlightColor;

  final Color splashColor;

  final Brightness colorBrightness;

  final EdgeInsetsGeometry padding;

  final VisualDensity visualDensity;

  final ShapeBorder shape;

  final Clip clipBehavior;

  final FocusNode focusNode;

  final bool autofocus;

  final MaterialTapTargetSize materialTapTargetSize;

  final Widget child;

  final double height;

  final double minWidth;

  final BorderRadiusGeometry borderRadiusGeometry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.0,
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadiusGeometry ?? BorderRadius.circular(24.0),
        elevation: buttonStyle.elevation,
        child: FlatButton(
          textTheme: textTheme,
          onHighlightChanged: onHighlightChanged,
          textColor: textColor,
          splashColor: splashColor,
          visualDensity: visualDensity,
          onLongPress: onLongPress,
          materialTapTargetSize: materialTapTargetSize,
          focusNode: focusNode,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          disabledTextColor: disabledTextColor,
          focusColor: focusColor,
          colorBrightness: colorBrightness,
          disabledColor: disabledColor,
          minWidth: minWidth,
          autofocus: autofocus,
          color: color,
          onPressed: onTap,
          clipBehavior: clipBehavior,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
          padding: padding ?? EdgeInsets.zero,
          child: child ??
              Ink(
                decoration: buttonStyle.decoration,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: buttonStyle.textStyle,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
