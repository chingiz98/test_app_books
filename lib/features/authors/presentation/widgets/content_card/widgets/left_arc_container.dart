import 'package:flutter/material.dart';
import 'package:testapp/features/authors/presentation/widgets/content_card/widgets/arc_clipper.dart';

class LeftArcContainer extends StatelessWidget {
  const LeftArcContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArcClipper(),
      child: child,
    );
  }
}
