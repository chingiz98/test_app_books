import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author.freezed.dart';

part 'author.g.dart';

@freezed
abstract class Author with _$Author {
  factory Author({
    @required int id,
    @required String name,
    @required String bio,
    @required String birth_date,
    @required String died_date,
    String image,
  }) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) =>
      _$AuthorFromJson(json);
}
