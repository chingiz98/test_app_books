import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/icons/custom_icons.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    this.padding,
    this.decoration,
    this.foregroundDecoration,
    this.constraints,
    this.margin,
    this.transform,
    this.actionAppBar,
    this.title,
    this.actions,
    this.iconSize,
    this.leadingColor,
    this.brightness = Brightness.dark,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final EdgeInsetsGeometry padding;

  final Decoration decoration;

  final Decoration foregroundDecoration;

  final BoxConstraints constraints;

  final EdgeInsetsGeometry margin;

  final Matrix4 transform;

  final Widget actionAppBar;

  final Widget title;

  final List<Widget> actions;

  final double iconSize;

  final Color leadingColor;

  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    IconButton _buildAppBarIcon(
      BuildContext context, {
      @required IconData icon,
    }) {
      return IconButton(
        icon: Icon(icon),
        onPressed: () => Navigator.maybePop(context),
        iconSize: iconSize ?? 21.0,
        color: leadingColor ?? CustomColors.whiteColor,
      );
    }

    Widget _buildLeadingButton({
      @required BuildContext context,
      @required bool isFullScreenDialog,
    }) {
      return isFullScreenDialog
          ? _buildAppBarIcon(context, icon: CustomIcons.close)
          : _buildAppBarIcon(context, icon: CustomIcons.back);
    }

    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);

    final bool canPop = parentRoute?.canPop ?? false;

    final bool fullScreenDialog =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    return Container(
      margin: margin,
      transform: transform,
      padding: padding,
      decoration: decoration ??
          const BoxDecoration(
            gradient: CustomTheme.gradientColorTheme,
          ),
      child: AppBar(
        centerTitle: true,
        title: title,
        actions: actions,
        brightness: brightness,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: canPop
            ? _buildLeadingButton(
                context: context,
                isFullScreenDialog: fullScreenDialog,
              )
            : null,
      ),
    );
  }
}
