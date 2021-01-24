import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/bottom_bar/models/custom_bottom_bar_item.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    Key key,
    this.items,
    this.height = 50.0,
    this.iconSize = 18.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.onTab,
    this.elevation = 16.0,
    this.initialRoute,
  })  : assert(items != null || items.length >= 1),
        super(key: key);

  final List<CustomBottomBarItem> items;

  final double height;

  final double iconSize;

  final Color backgroundColor;

  final Color color;

  final Color selectedColor;

  final ValueChanged<CustomBottomBarItem> onTab;

  final double elevation;

  final String initialRoute;

  @override
  State<StatefulWidget> createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  String _selectedRoute;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: widget.elevation,
      color: widget.backgroundColor,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            widget.items.length,
            (int index) {
              return _buildItem(
                item: widget.items[index],
                index: index,
                onPressed: (index) => _updateSelectedRoute(widget.items[index]),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildItem({
    @required CustomBottomBarItem item,
    @required int index,
    @required ValueChanged<int> onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          color: widget.backgroundColor,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (item.incoming)
                  Stack(
                    children: [
                      SizedBox(
                        height: widget.iconSize * 1.3,
                        width: widget.iconSize * 1.3,
                        child: Icon(
                          item.icon,
                          color: _getTabColor(item),
                          size: widget.iconSize,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: CircleAvatar(
                          radius: widget.iconSize / 3,
                          backgroundColor: CustomColors.accentOrange,
                        ),
                      )
                    ],
                  )
                else
                  Icon(
                    item.icon,
                    color: _getTabColor(item),
                    size: widget.iconSize,
                  ),
                Text(
                  item.text,
                  style: CustomTheme.textGray10SourceSansPro400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getTabColor(CustomBottomBarItem item) =>
      item.route == _selectedRoute ? widget.selectedColor : widget.color;

  void _updateSelectedRoute(CustomBottomBarItem item) {
    widget.onTab(item);
    setState(
      () {
        _selectedRoute = item.route;
      },
    );
  }

  @override
  void initState() {
    _selectedRoute = widget.initialRoute;
    super.initState();
  }
}
