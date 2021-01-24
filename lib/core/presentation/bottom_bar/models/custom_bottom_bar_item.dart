import 'package:flutter/material.dart';

class CustomBottomBarItem {
  const CustomBottomBarItem({
    @required this.icon,
    @required this.route,
    this.text,
    this.incoming = false,
  }) : assert(icon != null);

  final IconData icon;
  final String text;
  final bool incoming;
  final String route;
}
