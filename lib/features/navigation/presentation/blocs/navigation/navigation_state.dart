part of 'navigation_bloc.dart';

@freezed
abstract class NavigationState with _$NavigationState {
  const factory NavigationState.initial({
    @required Navigator navigator,
    @required RouteSettings currentSettings,
  }) = NavigationInitial;

  const factory NavigationState.appInProgress({
    @required WidgetBuilder builder,
    @required Navigator navigator,
    @required RouteSettings currentSettings,
  }) = NavigationAppInProgress;

  const factory NavigationState.authInProgress({
    @required WidgetBuilder builder,
    @required Navigator navigator,
    @required RouteSettings currentSettings,
  }) = NavigationAuthInProgress;
}
