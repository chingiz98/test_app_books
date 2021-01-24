part of 'books_bloc.dart';

@freezed
abstract class BooksState with _$BooksState {
  const factory BooksState.initial({
    @required List<Book> books,
    @required List<Book> favorites,
  }) = BooksInitial;

  const factory BooksState.inProgress({
    @required List<Book> books,
    @required List<Book> favorites,
  }) = BooksInProgress;

  const factory BooksState.success({
    @required List<Book> books,
    @required List<Book> favorites,
  }) = BooksSuccess;

  const factory BooksState.failure({
    @required AppError error,
    @required List<Book> books,
    @required List<Book> favorites,
  }) = BooksFailure;
}
