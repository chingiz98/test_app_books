import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:testapp/features/authors/infrastructure/models/responses/get_books_response.dart';
import 'package:testapp/features/authors/infrastructure/models/responses/get_authors_response.dart';
import 'package:retrofit/retrofit.dart';

part 'i_books_and_authors_service.g.dart';

@RestApi()
@lazySingleton
abstract class IBooksAndAuthorsService {
  @factoryMethod
  factory IBooksAndAuthorsService(Dio dio) = _IBooksAndAuthorsService;

  @GET('/api/authors')
  Future<GetAuthorsResponse> getAuthors();

  @GET('/api/authors/{authorId}/books')
  Future<GetBooksResponse> getAuthorBooks({
    @required @Path('authorId') int authorId,
  });

  @GET('/api/books')
  Future<GetBooksResponse> getAllBooks();

  @POST('/api/books/{bookId}/add-to-favorites')
  Future<void> addBookToFavorites({
    @required @Path('bookId') int bookId,
  });

  @POST('/api/books/{bookId}/remove-from-favorites')
  Future<void> removeBookFromFavorites({
    @required @Path('bookId') int bookId,
  });

  @GET('/api/favorite-books')
  Future<GetBooksResponse> getFavoriteBooks();
}
