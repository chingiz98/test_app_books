import 'package:flutter/material.dart';

class NavigationObserver extends RouteObserver<PageRoute<dynamic>> {
  NavigationObserver({@required this.onChanged});

  final ValueChanged<RouteSettings> onChanged;

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPush(route, previousRoute);
    onChanged(route.settings);
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    onChanged(newRoute.settings);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    super.didPop(route, previousRoute);
    onChanged(previousRoute.settings);
  }
}
