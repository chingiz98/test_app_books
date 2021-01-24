import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testapp/features/authors/infrastructure/models/author.dart';
import 'package:testapp/features/authors/infrastructure/models/book.dart';

part 'get_books_response.freezed.dart';

part 'get_books_response.g.dart';

@freezed
abstract class GetBooksResponse with _$GetBooksResponse {
  factory GetBooksResponse({
    @required List<Book> data,
  }) = _GetBooksResponse;

  factory GetBooksResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBooksResponseFromJson(json);
}
