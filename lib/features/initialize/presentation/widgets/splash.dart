import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/gradient_container/gradient_container.dart';
import 'package:testapp/features/initialize/presentation/widgets/logo.dart';

class Splash extends StatelessWidget {
  const Splash({
    Key key,
    @required this.child,
    @required this.showedWhen,
    @required this.duration,
  })  : assert(child != null),
        assert(showedWhen != null),
        super(key: key);

  final Widget child;
  final bool showedWhen;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          child,
          AnimatedSwitcher(
            duration: showedWhen ? const Duration() : duration,
            transitionBuilder: _buildTransition,
            child: showedWhen
                ? Scaffold(
                    body: _buildSplash(),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildSplash() {
    return const GradientContainer(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Logo(),
      ),
    );
  }

  Widget _buildTransition(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
