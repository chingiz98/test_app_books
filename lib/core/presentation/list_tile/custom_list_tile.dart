import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key key,
    @required this.title,
    @required this.trailing,
  }) : super(key: key);

  final Widget title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 26.0),
            child: DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.greyText,
                  ),
              child: title,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 44.0),
            child: Align(
              alignment: Alignment.topRight,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 70),
                child: Padding(
                  padding: const EdgeInsets.only(top: 26.0),
                  child: DefaultTextStyle.merge(
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                    child: trailing,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
