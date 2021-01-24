import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/presentation/app_bar/custom_app_bar.dart';
import 'package:testapp/core/presentation/buttons/style_types/wide_action_button_style.dart';
import 'package:testapp/core/presentation/buttons/wide_action_button.dart';
import 'package:testapp/core/presentation/text_field/custom_text_field.dart';
import 'package:testapp/features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:testapp/features/initialize/presentation/bloc/splash/splash_bloc.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          context.l10n.createAnAccount,
          style: context.theme.textTheme.headline3,
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) => getIt<SignUpBloc>(),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: _signUpStateListener,
            builder: _signUpStateBuilder,
          ),
        ),
      ),
    );
  }

  void _onSignedUp(BuildContext context, User user) {
    context.splashBloc.add(SplashUserAuthorized(user: user));
  }

  void _signUpStateListener(BuildContext context, SignUpState state) {
    state.maybeMap(
      success: (state) => _onSignedUp(context, state.user),
      failure: (error) {
        return context.showErrorDialog<void>(context, error.error);
      },
      orElse: () {},
    );
  }

  Widget _signUpStateBuilder(
    BuildContext context,
    SignUpState state,
  ) {
    return state.maybeMap(
      inProgress: (_) => _buildCircularIndicator(),
      orElse: () => _buildSignUpForm(context, state),
    );
  }

  Widget _buildCircularIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSignUpForm(BuildContext context, SignUpState state) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 43.0,
                  left: 32.0,
                  right: 32.0,
                ),
                child: CustomTextField(
                  controller: state.nameController,
                  hintText: context.l10n.name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 32.0,
                  right: 32.0,
                  top: 32.0,
                ),
                child: CustomTextField(
                  controller: state.emailController,
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
                  hintText: context.l10n.password,
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 32.0,
                  right: 32.0,
                  top: 32.0,
                ),
                child: CustomTextField(
                  controller: state.passwordConfirmController,
                  hintText: context.l10n.repeatPassword,
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: WideActionButton(
                  buttonStyle: WideActionButtonStyle.gradient,
                  title: context.l10n.signup,
                  onTap: () {
                    context.signUpBloc.add(
                      SignedUp(
                        name: state.nameController?.text,
                        email: state.emailController?.text,
                        password: state.passwordController?.text,
                        passwordConfirm: state.passwordConfirmController?.text,
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
}
