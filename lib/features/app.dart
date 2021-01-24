import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/infrastructure/intl/jump_localizations_delegate.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/core/presentation/dialogs/custom_dialog.dart';
import 'package:testapp/core/presentation/dialogs/custom_dialog_action.dart';
import 'package:testapp/core/presentation/dialogs/custom_dialog_action_style.dart';
import 'package:testapp/core/presentation/dialogs/custom_dialog_style.dart';
import 'package:testapp/core/presentation/themes/custom_theme.dart';
import 'package:testapp/features/initialize/presentation/bloc/splash/splash_bloc.dart';
import 'package:testapp/features/initialize/presentation/widgets/splash.dart';
import 'package:testapp/features/navigation/infrastructure/models/navigation_type.dart';
import 'package:testapp/features/navigation/presentation/blocs/navigation/navigation_bloc.dart';

class App extends StatelessWidget {
  const App({
    Key key,
    @required this.environment,
  })  : assert(environment != null),
        super(key: key);

  final Environment environment;

  @override
  Widget build(BuildContext context) {
    return _settingsStateBuilder();
  }

  Widget _settingsStateBuilder() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (_) => getIt<SplashBloc>()
            ..add(
              const SplashStarted(
                duration: Duration(milliseconds: 2500),
              ),
            ),
        ),
      ],
      child: MaterialApp(
        theme: CustomTheme.mode[ThemeMode.light],
        onGenerateTitle: (context) => context.l10n.appTitle,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          JumpLocalizationsDelegate.delegate,
        ],
        home: const SizedBox(),
        supportedLocales: const [Locale('ru'), Locale('en')],
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget child) {
          return Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute<dynamic>(
                builder: (context) => _navigatorBuilder(context, child),
              );
            },
          );
        },
      ),
    );
  }

  Widget _navigatorBuilder(BuildContext context, Widget nativeNavigator) {
    assert(nativeNavigator is Navigator);
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (_) => getIt<NavigationBloc>(
            param1: nativeNavigator as Navigator,
          ),
          lazy: false,
        ),
      ],
      child: _navigationBuilder(),
    );
  }

  Widget _navigationBuilder() {
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, navigationState) {
        return BlocConsumer<SplashBloc, SplashState>(
          builder: (BuildContext context, SplashState splashState) {
            return _splashBuilder(
              context: context,
              splashState: splashState,
              navigationState: navigationState,
            );
          },
          listener: _splashListener,
        );
      },
    );
  }

  Widget _splashBuilder({
    @required BuildContext context,
    @required SplashState splashState,
    @required NavigationState navigationState,
  }) {
    final child = navigationState.map(
      authInProgress: (s) => s.builder(context),
      appInProgress: (s) => s.builder(context),
      initial: (_) => const SizedBox(),
    );

    return Splash(
      showedWhen:
          splashState is SplashInProgress || splashState is SplashInitial,
      duration: const Duration(milliseconds: 250),
      child: child,
    );
  }

  void _splashListener(BuildContext context, SplashState state) {
    state.maybeMap(
      success: (_) {
        context.navigationBloc.add(
          const NavigationSwitched(type: NavigationType.app),
        );
      },
      failure: (failure) {
        if (failure.error.isAuthorization) {
          (failure.error as AppAuthorizationError).failure.map(
            unauthorized: (_) {
              context.navigationBloc.add(
                const NavigationSwitched(type: NavigationType.auth),
              );
            },
          );
        } else {
          CustomDialog.showDialog<void>(
            context: context,
            actions: (context) {
              return [
                CustomDialogAction(
                  title: context.l10n.ok,
                  style: CustomDialogActionStyle.regular,
                  onPressed: () => _onErrorDialogButtonPressed(context),
                ),
              ];
            },
            title: context.l10n.warning,
            description: failure.error.toLocale(context),
            style: CustomDialogStyle.question,
          );
        }
      },
      orElse: () {},
    );
  }

  void _onErrorDialogButtonPressed(BuildContext context) =>
      Navigator.of(context).pop();
}
