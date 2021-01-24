import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

part 'book.g.dart';

@freezed
abstract class Book with _$Book {
  factory Book({
    @required int id,
    @required String name,
    @required String desc,
    @required int author_id,
    String image,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) =>
      _$BookFromJson(json);
}
