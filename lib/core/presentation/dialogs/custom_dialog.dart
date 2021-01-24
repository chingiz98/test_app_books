import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_svg/svg.dart';
import 'package:testapp/core/presentation/dialogs/custom_dialog_style.dart';
import 'package:testapp/core/presentation/icons/custom_svg_icons.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

class CustomDialog {
  const CustomDialog._();

  static Future<T> showDialog<T>({
    @required BuildContext context,
    @required String title,
    @required CustomDialogStyle style,
    @required List<Widget> Function(BuildContext context) actions,
    String description,
  }) {
    return material.showDialog<T>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: _buildTitleContent(
          text: title,
          style: style,
        ),
        content: description != null
            ? DefaultTextStyle.merge(
                style: CustomTheme.textDark14SourceSansPro400,
                child: Text(description),
              )
            : null,
        actions: actions(context),
      ),
    );
  }

  static Widget _buildTitleContent({
    @required String text,
    CustomDialogStyle style,
  }) {
    assert(text != null || text.isNotEmpty);
    return Column(
      children: [
        SvgPicture.asset(style == CustomDialogStyle.question
            ? CustomSVGIcons.question
            : CustomSVGIcons.check),
        const SizedBox(
          height: 19.0,
        ),
        Text(
          text,
          style: CustomTheme.textDark17Ubuntu700,
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}
