import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'commit.freezed.dart';
part 'commit.g.dart';

@freezed
abstract class Commit implements _$Commit {
  const Commit._();

  const factory Commit({
    @required String id,
    @required String title,
    @required String message,
    @JsonKey(name: 'author_email') String authorEmail,
    @JsonKey(name: 'author_name') String authorName,
    @JsonKey(name: 'authored_date') String authorDate,
    @JsonKey(name: 'committed_date') String committedDate,
    @JsonKey(name: 'committer_email') String committerEmail,
    @JsonKey(name: 'created_at') String createdAt,
  }) = _Commit;

  factory Commit.fromJson(Map<String, dynamic> json) => _$CommitFromJson(json);

  String get visibleName =>
      '${authorName}: ${title.substring(0, math.min(title.length, 50)).trim()} at ${createdAt})';
}
