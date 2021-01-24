part of 'authors_bloc.dart';

@freezed
abstract class AuthorsState with _$AuthorsState {
  const factory AuthorsState.initial({
    @required List<Author> authors,
    @required Map<int, List<Book>> authorBooks,
  }) = AuthorsInitial;

  const factory AuthorsState.inProgress({
    @required List<Author> authors,
    @required Map<int, List<Book>> authorBooks,
  }) = AuthorsInProgress;

  const factory AuthorsState.success({
    @required List<Author> authors,
    @required Map<int, List<Book>> authorBooks,
  }) = AuthorsSuccess;

  const factory AuthorsState.failure({
    @required AppError error,
    @required List<Author> authors,
    @required Map<int, List<Book>> authorBooks,
  }) = AuthorsFailure;
}
