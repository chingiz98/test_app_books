import 'package:flutter/material.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/presentation/icons/custom_icons.dart';

class ProfileSettingsTile extends StatelessWidget {
  const ProfileSettingsTile({
    Key key,
    @required this.context,
    @required this.text,
    @required this.icon,
    this.onTap,
  }) : super(key: key);

  final BuildContext context;
  final String text;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          icon,
          const SizedBox(
            width: 18.0,
          ),
          Text(
            text,
            style: context.theme.textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
      trailing: const Icon(
        CustomIcons.right,
        size: 12,
      ),
    );
  }
}
