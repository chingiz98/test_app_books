import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/dialogs/custom_dialog_action_style.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

class CustomDialogAction extends StatelessWidget {
  const CustomDialogAction({
    @required this.title,
    @required this.style,
    @required this.onPressed,
    Key key,
  }) : super(key: key);

  final String title;
  final CustomDialogActionStyle style;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoDialogAction(
      onPressed: onPressed,
      isDefaultAction: true,
      child: Text(
        title,
        style: style == CustomDialogActionStyle.regular
            ? CustomTheme.textDark17SFPro600
            : CustomTheme.textAccentViolet17SFPro600,
      ),
    );
  }
}
