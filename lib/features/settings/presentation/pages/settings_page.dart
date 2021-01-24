import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/presentation/app_bar/custom_app_bar.dart';
import 'package:testapp/core/presentation/buttons/style_types/wide_action_button_style.dart';
import 'package:testapp/core/presentation/buttons/wide_action_button.dart';
import 'package:testapp/core/presentation/list_tile/custom_list_tile.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';
import 'package:testapp/features/initialize/presentation/bloc/splash/splash_bloc.dart';
import 'package:testapp/features/navigation/presentation/pages/home_scaffold.dart';
import 'package:testapp/features/settings/infrastructure/models/user/user.dart';
import 'package:testapp/features/settings/presentation/blocs/profile/profile_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        title: Text(
          context.l10n.settingsPage,
          style: context.theme.textTheme.headline3,
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) =>
            getIt<ProfileBloc>()..add(const ProfileStarted()),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: _profileBuilder,
        ),
      ),
    );
  }

  Widget _profileBuilder(BuildContext context, ProfileState state) {
    return state.maybeMap(
      success: (state) => _buildProfileInfo(
        context: context,
        user: state.user,
      ),
      orElse: () => _buildLoading(),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildProfileInfo({
    @required BuildContext context,
    @required User user,
  }) {
    final _content = _buildProfileListContent(
      context: context,
      user: user,
    );

    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: ListView.separated(
              itemBuilder: (context, index) => _content[index],
              itemCount: _content.length,
              separatorBuilder: (context, index) => Divider(
                color: CustomColors.greyText.withOpacity(0.15),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: WideActionButton(
            buttonStyle: WideActionButtonStyle.transparentAccentViolet,
            title: context.l10n.logOut,
            onTap: () => _onLogOutPressed(context),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildProfileListContent({
    @required BuildContext context,
    @required User user,
  }) {
    final List<Widget> _content = [];

    if (user.id.isNotEmpty) {
      _content.add(
        CustomListTile(
          title: Text(context.l10n.id),
          trailing: Text(user.id),
        ),
      );
    }

    if (user.firstName.isNotEmpty) {
      _content.add(
        CustomListTile(
          title: Text(context.l10n.firstName),
          trailing: Text(user.firstName),
        ),
      );
    }

    if (user.email.isNotEmpty) {
      _content.add(
        CustomListTile(
          title: Text(context.l10n.email),
          trailing: Text(user.email),
        ),
      );
    }

    return _content;
  }

  void _onLogOutPressed(BuildContext context) {
    context.splashBloc.add(const SplashUserUnauthorized());
  }
}
