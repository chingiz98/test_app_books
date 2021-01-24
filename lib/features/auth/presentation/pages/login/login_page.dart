import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/presentation/app_bar/custom_app_bar.dart';
import 'package:testapp/core/presentation/buttons/style_types/wide_action_button_style.dart';
import 'package:testapp/core/presentation/buttons/wide_action_button.dart';
import 'package:testapp/core/presentation/text_field/custom_text_field.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';
import 'package:testapp/features/auth/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:testapp/features/initialize/presentation/bloc/splash/splash_bloc.dart';
import 'package:testapp/features/initialize/presentation/widgets/logo.dart';
import 'package:testapp/features/navigation/presentation/routes/auth_router.gr.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        leadingColor: CustomColors.greyText,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) => getIt<SignInBloc>(),
          child: BlocConsumer<SignInBloc, SignInState>(
            listener: _signInStateListener,
            builder: _signInStateBuilder,
          ),
        ),
      ),
    );
  }

  void _signInStateListener(BuildContext context, SignInState state) {
    state.maybeMap(
      success: (user) => _authorizeUser(context, user.user),
      failure: (error) {
        return context.showErrorDialog<void>(context, error.error);
      },
      orElse: () {},
    );
  }

  void _authorizeUser(BuildContext context, User user) {
    context.splashBloc.add(SplashUserAuthorized(user: user));
  }

  Widget _signInStateBuilder(
    BuildContext context,
    SignInState state,
  ) {
    return state.maybeMap(
      inProgress: (_) => _buildCircularIndicator(),
      orElse: () => _buildSignInForm(context, state),
    );
  }

  Widget _buildCircularIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSignInForm(BuildContext context, SignInState state) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              const Logo(
                textColor: CustomColors.logoBlack,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 43.0,
                  left: 32.0,
                  right: 32.0,
                ),
                child: CustomTextField(
                  controller: state.emailController,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  hintText: context.l10n.email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 32.0,
                  right: 32.0,
                  top: 32.0,
                ),
                child: CustomTextField(
                  controller: state.passwordController,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  onChanged: (value) {},
                  hintText: context.l10n.password,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 38.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: WideActionButton(
                  buttonStyle: WideActionButtonStyle.gradient,
                  title: context.l10n.login,
                  onTap: () {
                    context.signInBloc.add(
                      SignedIn(
                        email: state.emailController?.text,
                        password: state.passwordController?.text,
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  void _onCreateAnAccountPressed(BuildContext context) {
    context.navigator.push(Routes.signUpPage);
  }
}
