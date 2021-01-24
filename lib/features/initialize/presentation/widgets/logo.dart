import 'package:flutter/material.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key key,
    this.textColor,
  }) : super(key: key);
  
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.l10n.appTitle,
            style: context.theme.textTheme.headline6.copyWith(
              fontFamily: CustomTheme.fontJosefinSans,
              color: textColor ?? CustomColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
