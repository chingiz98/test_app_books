import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/infrastructure/extensions/string_x.dart';
import 'package:testapp/core/infrastructure/intl/jump_localizations.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

extension BuildContextX on BuildContext {
  JumpLocalizations get l10n => JumpLocalizations.of(this);

  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Future<T> showErrorDialog<T>(BuildContext context, AppError error) {
    return showDialog<T>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: _buildTitleContent(
          context: context,
          text: error.toLocale(context),
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              context.l10n.close,
              style: CustomTheme.textAccentViolet17SFPro600,
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildTitleContent({
  BuildContext context,
  @required String text,
}) {
  assert(!text.isNullEmptyOrWhitespace);
  return Column(
    children: [
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
