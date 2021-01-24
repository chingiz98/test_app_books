part of 'books_bloc.dart';

@freezed
abstract class BooksEvent with _$BooksEvent {
  const factory BooksEvent.started({
    @required BooksPageType type,
    List<Book> books,
  }) = BooksStarted;

  const factory BooksEvent.addedToFavorites({
    @required Book book,
  }) = BooksAddedToFavorites;

  const factory BooksEvent.removedFromFavorites({
    @required Book book,
  }) = BooksRemovedFromFavorites;
}
