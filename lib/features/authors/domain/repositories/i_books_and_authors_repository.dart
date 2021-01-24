import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:testapp/core/infrastructure/models/errors/app_error.dart';
import 'package:testapp/features/authors/infrastructure/models/author.dart';
import 'package:testapp/features/authors/infrastructure/models/book.dart';

abstract class IBooksAndAuthorsRepository {
  Future<Either<AppError, List<Author>>> getAuthorsList();

  Future<Either<AppError, List<Book>>> getAuthorBooksList({
    int authorId,
  });

  Future<Either<AppError, List<Book>>> getAllBooks();

  Future<Either<AppError, void>> addBookToFavorites({
    @required int bookId,
  });

  Future<Either<AppError, void>> removeBookFromFavorites({
    @required int bookId,
  });

  Future<Either<AppError, List<Book>>> getFavoritesBooks();
}
