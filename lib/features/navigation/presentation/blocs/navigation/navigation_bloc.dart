import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:testapp/features/navigation/infrastructure/models/navigation_type.dart';
import 'package:testapp/features/navigation/infrastructure/observers/navigation_observer.dart';
import 'package:testapp/features/navigation/presentation/routes/app_router.gr.dart'
    as app;
import 'package:testapp/features/navigation/presentation/routes/auth_router.gr.dart'
    as auth;

part 'navigation_bloc.freezed.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

@injectable
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc(
    @factoryParam Navigator navigator,
  ) : super(NavigationInitial(
          navigator: navigator,
          currentSettings: _initialSettings(navigator),
        )) {
    _authNavigator = ExtendedNavigator.builder<auth.AuthRouter>(
      router: auth.AuthRouter(),
      navigatorKey: _authNavigatorKey,
      observers: [],
    );
    _appNavigator = ExtendedNavigator.builder<app.AppRouter>(
      router: app.AppRouter(),
      navigatorKey: _navigatorKey,
      observers: [
        NavigationObserver(
          onChanged: (settings) {
            add(NavigationRouteSettignsChanged(routeSettings: settings));
          },
        ),
      ],
    );
  }

  final _navigatorKey = GlobalKey<NavigatorState>();
  final _authNavigatorKey = GlobalKey<NavigatorState>();

  TransitionBuilder _appNavigator;
  TransitionBuilder _authNavigator;

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    yield* event.map(
      switched: _mapSwitchedToState,
      routeSettingsChanged: _mapRouteSettingsChangedToState,
      appNavigatorPush: _appNavigatorPushToState,
      appNavigatorPushReplacement: _appNavigatorPushReplacementToState,
    );
  }

  Stream<NavigationState> _mapSwitchedToState(NavigationSwitched event) async* {
    Logger.root.warning('NavigationSwitched $event');
    switch (event.type) {
      case NavigationType.auth:
        yield NavigationAuthInProgress(
          builder: (context) => _authNavigator(context, state.navigator),
          currentSettings: _initialSettings(state.navigator),
          navigator: state.navigator,
        );
        break;
      case NavigationType.app:
        yield NavigationAppInProgress(
          builder: (context) => _appNavigator(context, state.navigator),
          currentSettings: _initialSettings(state.navigator),
          navigator: state.navigator,
        );
        break;
      default:
        throw Exception('Invalid router type');
    }
  }

  Stream<NavigationState> _mapRouteSettingsChangedToState(
    NavigationRouteSettignsChanged event,
  ) async* {
    yield state.copyWith(
      currentSettings: event.routeSettings,
    );
  }

  Stream<NavigationState> _appNavigatorPushToState(
    NavigationAppNavigatorPush event,
  ) async* {
    _navigatorKey.currentState.pushNamed(event.route);
  }

  Stream<NavigationState> _appNavigatorPushReplacementToState(
    NavigationAppNavigatorPushReplacement event,
  ) async* {
    _navigatorKey.currentState.pushNamedAndRemoveUntil(
      event.route,
      (route) => false,
    );
  }

  static RouteSettings _initialSettings(Navigator navigator) =>
      RouteSettings(name: navigator.initialRoute);
}

extension NavigationBlocBuildContextX on BuildContext {
  NavigationBloc get navigationBloc => BlocProvider.of<NavigationBloc>(this);
}
