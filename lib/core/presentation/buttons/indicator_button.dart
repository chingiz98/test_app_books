import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/buttons/style_types/inline_indicator_button_style.dart';
import 'package:testapp/core/presentation/buttons/widgets/count_messages.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

class InlineIndicatorButton extends StatelessWidget {
  const InlineIndicatorButton({
    Key key,
    this.onTap,
    @required this.title,
    this.inlineButtonStyle,
    this.countMessages,
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
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.child,
    this.height,
    this.minWidth,
    this.borderRadiusGeometry,
    this.width,
  })  : assert(title != null && title != ''),
        assert(clipBehavior != null),
        assert(autofocus != null),
        super(key: key);

  final String countMessages;

  final VoidCallback onTap;

  final Widget title;

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

  final InlineIndicatorButtonStyle inlineButtonStyle;

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.0,
      width: width,
      child: FlatButton(
        padding: padding,
        clipBehavior: clipBehavior,
        height: height,
        autofocus: autofocus,
        minWidth: minWidth,
        disabledColor: disabledColor,
        colorBrightness: colorBrightness,
        focusNode: focusNode,
        focusColor: focusColor,
        disabledTextColor: disabledTextColor,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        onLongPress: onLongPress,
        materialTapTargetSize: materialTapTargetSize,
        visualDensity: visualDensity,
        splashColor: splashColor,
        textTheme: textTheme,
        textColor: textColor,
        onHighlightChanged: onHighlightChanged,
        color: inlineButtonStyle.color,
        onPressed: onTap,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
        child: child ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle.merge(
                  style: CustomTheme.textWhite15SourceSansPro600,
                  child: title,
                ),
                if (countMessages != null && countMessages != '')
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: CountMessages(title: countMessages),
                  )
                else
                  const SizedBox(),
              ],
            ),
      ),
    );
  }
}
