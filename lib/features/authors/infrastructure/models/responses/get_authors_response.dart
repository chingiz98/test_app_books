import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testapp/features/authors/infrastructure/models/author.dart';

part 'get_authors_response.freezed.dart';

part 'get_authors_response.g.dart';

@freezed
abstract class GetAuthorsResponse with _$GetAuthorsResponse {
  factory GetAuthorsResponse({
    @required List<Author> data,
  }) = _GetAuthorsResponse;

  factory GetAuthorsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAuthorsResponseFromJson(json);
}
