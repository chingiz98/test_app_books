import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/presentation/app_bar/custom_app_bar.dart';
import 'package:testapp/features/books/infrastructure/models/books_page_type.dart';
import 'package:testapp/features/books/presentation/blocs/books/books_bloc.dart';
import 'package:testapp/features/books/presentation/widgets/books_state_builder.dart';
import 'package:testapp/features/navigation/presentation/pages/home_scaffold.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        title: Text(
          context.l10n.favoritesPage,
          style: context.theme.textTheme.headline3,
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => getIt<BooksBloc>()
          ..add(const BooksStarted(
            type: BooksPageType.favourites,
          )),
        child: BlocBuilder<BooksBloc, BooksState>(
          builder: (BuildContext context, BooksState state) =>
              BooksStateBuilder(
                state: state,
              ),
        ),
      ),
    );
  }
}
