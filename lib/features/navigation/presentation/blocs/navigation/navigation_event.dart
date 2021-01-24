part of 'navigation_bloc.dart';

@freezed
abstract class NavigationEvent with _$NavigationEvent {
  const factory NavigationEvent.switched({
    @required NavigationType type,
  }) = NavigationSwitched;

  const factory NavigationEvent.routeSettingsChanged({
    @required RouteSettings routeSettings,
  }) = NavigationRouteSettignsChanged;

  const factory NavigationEvent.appNavigatorPush({
    @required String route,
  }) = NavigationAppNavigatorPush;

  const factory NavigationEvent.appNavigatorPushReplacement({
    @required String route,
  }) = NavigationAppNavigatorPushReplacement;
}
