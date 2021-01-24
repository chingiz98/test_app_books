import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/presentation/app_bar/custom_app_bar.dart';
import 'package:testapp/features/authors/infrastructure/models/author.dart';
import 'package:testapp/features/authors/infrastructure/models/book.dart';
import 'package:testapp/features/authors/presentation/blocs/authors/authors_bloc.dart';
import 'package:testapp/features/authors/presentation/widgets/content_card/content_card.dart';
import 'package:testapp/features/navigation/presentation/pages/home_scaffold.dart';
import 'package:testapp/features/navigation/presentation/routes/app_router.gr.dart';

class AuthorsPage extends StatelessWidget {
  const AuthorsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        title: Text(
          context.l10n.authorsPage,
          style: context.theme.textTheme.headline3,
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) =>
            getIt<AuthorsBloc>()..add(const AuthorsStarted()),
        child: BlocBuilder<AuthorsBloc, AuthorsState>(
          builder: _homeCategoryStateBuilder,
        ),
      ),
    );
  }

  Widget _homeCategoryStateBuilder(
    BuildContext context,
    AuthorsState state,
  ) {
    return state.maybeMap(
      success: (state) => _buildHomePage(
        context: context,
        authors: state.authors,
        books: state.authorBooks,
      ),
      orElse: () => _buildLoading(),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildHomePage({
    @required BuildContext context,
    @required List<Author> authors,
    @required Map<int, List<Book>> books,
  }) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 36.0,
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              children: authors.map(
                (author) {
                  return GestureDetector(
                    onTap: () {
                      context.navigator.push(
                        Routes.authorBooksPage,
                        arguments: AuthorBooksPageArguments(
                          books: books[author.id],
                          author: author,
                        ),
                      );
                    },
                    child: ContentCard(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          author.image ?? 'https://via.placeholder.com/150',
                        ),
                      ),
                      name: Text(author.name),
                      description: books[author.id] != null
                          ? 'books:${books[author.id].length}'
                          : 'No books',
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
