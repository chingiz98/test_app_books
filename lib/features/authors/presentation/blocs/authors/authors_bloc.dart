import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/authors/domain/repositories/i_books_and_authors_repository.dart';
import 'package:testapp/features/authors/infrastructure/models/author.dart';
import 'package:testapp/features/authors/infrastructure/models/book.dart';

part 'authors_bloc.freezed.dart';

part 'authors_event.dart';

part 'authors_state.dart';

@injectable
class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  AuthorsBloc(this._authorRepository)
      : super(const AuthorsInitial(
          authors: [],
          authorBooks: {},
        ));

  final IBooksAndAuthorsRepository _authorRepository;

  @override
  Stream<AuthorsState> mapEventToState(AuthorsEvent event) async* {
    yield* event.map(
      started: _startedToState,
      booksLoaded: _booksLoadedToState,
    );
  }

  Stream<AuthorsState> _startedToState(AuthorsStarted event) async* {
    yield AuthorsInProgress(
      authors: state.authors,
      authorBooks: state.authorBooks,
    );

    final result = await _authorRepository.getAuthorsList();

    yield result.fold(
      (error) => AuthorsFailure(
        error: error,
        authors: state.authors,
        authorBooks: state.authorBooks,
      ),
      (authors) {
        _loadAuthorsBooks(authors);
        return AuthorsSuccess(
          authors: authors,
          authorBooks: state.authorBooks,
        );
      },
    );
  }

  void _loadAuthorsBooks(List<Author> authors) {
    authors.forEach((author) async {
      _authorRepository
          .getAuthorBooksList(
        authorId: author.id,
      )
          .then((books) {
        if (books.isRight()) {
          add(AuthorsBooksLoaded(
            id: author.id,
            books: books | null,
          ));
        }
      });
    });
  }

  Stream<AuthorsState> _booksLoadedToState(AuthorsBooksLoaded event) async* {
    final Map<int, List<Book>> newMap = {};
    newMap.addAll(state.authorBooks);
    newMap[event.id] = event.books;

    yield state.copyWith(authorBooks: newMap);
  }
}

extension AuthorsBlocBuildContextX on BuildContext {
  AuthorsBloc get authorsBloc => BlocProvider.of<AuthorsBloc>(this);
}
