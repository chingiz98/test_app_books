part of 'authors_bloc.dart';

@freezed
abstract class AuthorsEvent with _$AuthorsEvent {
  const factory AuthorsEvent.started() = AuthorsStarted;

  const factory AuthorsEvent.booksLoaded({
    @required int id,
    @required List<Book> books,
  }) = AuthorsBooksLoaded;
}
