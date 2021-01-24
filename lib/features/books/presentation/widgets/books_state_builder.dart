import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testapp/features/authors/infrastructure/models/book.dart';
import 'package:testapp/features/authors/presentation/widgets/content_card/content_card.dart';
import 'package:testapp/features/books/presentation/blocs/books/books_bloc.dart';

class BooksStateBuilder extends StatelessWidget {
  const BooksStateBuilder({
    Key key,
    @required this.state,
  }) : super(key: key);

  final BooksState state;

  @override
  Widget build(BuildContext context) {
    return state.maybeMap(
      success: (state) => _buildAuthorsBooksPage(
        context: context,
        books: state.books,
        favorites: state.favorites,
      ),
      orElse: () => _buildLoading(),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildAuthorsBooksPage({
    @required BuildContext context,
    @required List<Book> books,
    @required List<Book> favorites,
  }) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 36.0,
            ),
            child: books.isEmpty
                ? Center(child: Text('No data'))
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    children: books.map(
                      (book) {
                        return ContentCard(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              book.image ?? 'https://via.placeholder.com/150',
                            ),
                          ),
                          likedByUser: favorites
                              .where((element) => element.id == book.id)
                              .isNotEmpty,
                          name: Text(book.name ?? ''),
                          description: book.desc ?? '',
                          onLikePressed: (liked) {
                            if (liked) {
                              context.booksBloc
                                  .add(BooksAddedToFavorites(book: book));
                            } else {
                              context.booksBloc.add(BooksRemovedFromFavorites(
                                book: book,
                              ));
                            }
                          },
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
