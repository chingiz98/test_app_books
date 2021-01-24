import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:testapp/core/domain/services/i_logger_service.dart';
import 'package:testapp/core/infrastructure/injection.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/authors/domain/repositories/i_books_and_authors_repository.dart';
import 'package:testapp/features/authors/domain/services/i_books_and_authors_service.dart';
import 'package:testapp/features/authors/infrastructure/models/author.dart';
import 'package:testapp/features/authors/infrastructure/models/book.dart';

@LazySingleton(as: IBooksAndAuthorsRepository)
class BooksAndAuthorsRepository implements IBooksAndAuthorsRepository {
  BooksAndAuthorsRepository(this._authorService)
      : _log = getIt<ILoggerService>().create('AuthorRepository');

  final Logger _log;
  final IBooksAndAuthorsService _authorService;

  @override
  Future<Either<AppError, List<Book>>> getAuthorBooksList({
    int authorId,
  }) async {
    try {
      final result = await _authorService.getAuthorBooks(authorId: authorId);
      return Right(result.data);
    } catch (e, s) {
      _log.shout('getAuthorBooksList', e, s);
      return Left(AppError.fromException(e));
    }
  }

  @override
  Future<Either<AppError, List<Author>>> getAuthorsList() async {
    try {
      final result = await _authorService.getAuthors();
      return Right(result.data);
    } catch (e, s) {
      _log.shout('getAuthorsList', e, s);
      return Left(AppError.fromException(e));
    }
  }

  @override
  Future<Either<AppError, void>> addBookToFavorites({
    int bookId,
  }) async {
    try {
      final result = await _authorService.addBookToFavorites(bookId: bookId);
      return Right(result);
    } catch (e, s) {
      _log.shout('addBookToFavorites', e, s);
      return Left(AppError.fromException(e));
    }
  }

  @override
  Future<Either<AppError, List<Book>>> getAllBooks() async {
    try {
      final result = await _authorService.getAllBooks();
      return Right(result.data);
    } catch (e, s) {
      _log.shout('getAllBooks', e, s);
      return Left(AppError.fromException(e));
    }
  }

  @override
  Future<Either<AppError, List<Book>>> getFavoritesBooks() async {
    try {
      final result = await _authorService.getFavoriteBooks();
      return Right(result.data);
    } catch (e, s) {
      _log.shout('getFavoritesBooks', e, s);
      return Left(AppError.fromException(e));
    }
  }

  @override
  Future<Either<AppError, void>> removeBookFromFavorites({
    int bookId,
  }) async {
    try {
      final result = await _authorService.removeBookFromFavorites(
        bookId: bookId,
      );
      return Right(result);
    } catch (e, s) {
      _log.shout('removeBookFromFavorites', e, s);
      return Left(AppError.fromException(e));
    }
  }
}
