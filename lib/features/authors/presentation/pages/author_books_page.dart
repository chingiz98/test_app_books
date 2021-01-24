import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/core/infrastructure/extensions/build_context_x.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/presentation/app_bar/custom_app_bar.dart';
import 'package:testapp/features/authors/infrastructure/models/author.dart';
import 'package:testapp/features/authors/infrastructure/models/book.dart';
import 'package:testapp/features/books/infrastructure/models/books_page_type.dart';
import 'package:testapp/features/books/presentation/blocs/books/books_bloc.dart';
import 'package:testapp/features/books/presentation/widgets/books_state_builder.dart';
import 'package:testapp/features/navigation/presentation/pages/home_scaffold.dart';

class AuthorBooksPage extends StatelessWidget {
  const AuthorBooksPage({
    @required this.books,
    @required this.author,
    Key key,
  }) : super(key: key);

  final List<Book> books;
  final Author author;

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      appBar: CustomAppBar(
        title: Text(
          author.name,
          style: context.theme.textTheme.headline3,
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) => getIt<BooksBloc>()
          ..add(BooksStarted(
            type: BooksPageType.authors,
            books: books,
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
