import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/presentation/buttons/style_types/wide_action_button_style.dart';
import 'package:testapp/core/presentation/buttons/wide_action_button.dart';
import 'package:testapp/core/presentation/gradient_container/gradient_container.dart';
import 'package:testapp/features/initialize/presentation/widgets/logo.dart';
import 'package:testapp/features/navigation/presentation/routes/auth_router.gr.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        width: double.infinity,
        height: double.infinity,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    const Logo(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 87.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: WideActionButton(
                        buttonStyle: WideActionButtonStyle.white,
                        title: context.l10n.login,
                        onTap: () => _onLogInButtonPressed(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: WideActionButton(
                        buttonStyle: WideActionButtonStyle.white,
                        title: context.l10n.createAnAccount,
                        onTap: () => _onSignUpButtonPressed(context),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogInButtonPressed(BuildContext context) {
    context.navigator.push(Routes.loginPage);
  }

  void _onSignUpButtonPressed(BuildContext context) {
    context.navigator.push(Routes.signUpPage);
  }
}
