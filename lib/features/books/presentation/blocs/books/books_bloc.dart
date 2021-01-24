import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/authors/domain/repositories/i_books_and_authors_repository.dart';
import 'package:testapp/features/authors/infrastructure/models/book.dart';
import 'package:testapp/features/books/infrastructure/models/books_page_type.dart';

part 'books_bloc.freezed.dart';

part 'books_event.dart';

part 'books_state.dart';

@injectable
class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc(this._booksAndAuthorsRepository)
      : super(const BooksInitial(
          books: [],
          favorites: [],
        ));

  final IBooksAndAuthorsRepository _booksAndAuthorsRepository;

  @override
  Stream<BooksState> mapEventToState(BooksEvent event) async* {
    yield* event.map(
      started: _startedToState,
      addedToFavorites: _addedToFavoritesToState,
      removedFromFavorites: _removedFromFavoritesToState,
    );
  }

  Stream<BooksState> _addedToFavoritesToState(
    BooksAddedToFavorites event,
  ) async* {
    final result = await _booksAndAuthorsRepository.addBookToFavorites(
      bookId: event.book.id,
    );

    yield result.fold(
      (error) => BooksFailure(
        error: error,
        books: state.books,
        favorites: state.favorites,
      ),
      (_) => state.copyWith(
        favorites: state.favorites
            .where((element) => element.id != event.book.id)
            .toList(),
      ),
    );
  }

  Stream<BooksState> _removedFromFavoritesToState(
    BooksRemovedFromFavorites event,
  ) async* {
    final result = await _booksAndAuthorsRepository.removeBookFromFavorites(
      bookId: event.book.id,
    );

    yield result.fold(
      (error) => BooksFailure(
        error: error,
        books: state.books,
        favorites: state.favorites,
      ),
      (_) => state.copyWith(
        favorites: [event.book, ...state.favorites],
      ),
    );
  }

  Stream<BooksState> _startedToState(
    BooksStarted event,
  ) async* {
    yield BooksInProgress(
      books: state.books,
      favorites: state.favorites,
    );

    final favResult = await _booksAndAuthorsRepository.getFavoritesBooks();
    if (favResult.isLeft()) {
      yield BooksFailure(
        error: favResult.swap() | null,
        books: state.books,
        favorites: state.favorites,
      );
      return;
    }

    final favorites = favResult | null;

    if (event.type == BooksPageType.authors) {
      yield BooksSuccess(
        books: event.books,
        favorites: favorites,
      );
    }

    if (event.type == BooksPageType.all) {
      final allResult = await _booksAndAuthorsRepository.getAllBooks();

      if (allResult.isLeft()) {
        yield BooksFailure(
          error: allResult.swap() | null,
          books: state.books,
          favorites: state.favorites,
        );
        return;
      }

      yield BooksSuccess(
        books: allResult | null,
        favorites: favorites,
      );
    }

    if (event.type == BooksPageType.favourites) {
      yield BooksSuccess(
        books: favorites,
        favorites: favorites,
      );
    }
  }
}

extension BooksBlocBuildContextX on BuildContext {
  BooksBloc get booksBloc => BlocProvider.of<BooksBloc>(this);
}
