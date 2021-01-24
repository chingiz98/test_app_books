import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/presentation/bottom_bar/models/custom_bottom_bar_item.dart';
import 'package:testapp/core/presentation/bottom_bar/custom_bottom_bar.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';
import 'package:testapp/features/navigation/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:testapp/features/navigation/presentation/routes/app_router.gr.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    Key key,
    this.appBar,
    @required this.body,
  }) : super(key: key);

  final Widget body;
  final PreferredSizeWidget appBar;

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildNavigationBar(BuildContext context, String initialRoute) {
    return CustomBottomBar(
      initialRoute: initialRoute,
      color: CustomColors.greyOpacity60,
      backgroundColor: CustomColors.whiteColor,
      selectedColor: CustomColors.accentViolet,
      onTab: (tab) {
        final routeEvent = NavigationAppNavigatorPushReplacement(
          route: tab.route,
        );
        context.navigationBloc.add(routeEvent);
      },
      items: const [
        CustomBottomBarItem(
          icon: Icons.assignment_ind_rounded,
          text: 'Authors',
          route: Routes.authorsPage,
        ),
        CustomBottomBarItem(
          icon: Icons.menu_book_rounded,
          text: 'Books',
          route: Routes.booksPage,
        ),
        CustomBottomBarItem(
          icon: Icons.favorite_rounded,
          text: 'Favourites',
          route: Routes.favoritesPage,
        ),
        CustomBottomBarItem(
          icon: Icons.settings_applications_rounded,
          text: 'Settings',
          route: Routes.settingsPage,
        ),
      ],
    );
  }

  Widget _navigationBarBlocBuilder() {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (BuildContext context, NavigationState state) {
        return state.map(
          initial: (s) => const SizedBox(),
          appInProgress: (s) {
            return _buildNavigationBar(context, s.currentSettings.name);
          },
          authInProgress: (s) => const SizedBox(),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: _navigationBarBlocBuilder(),
    );
  }
}
