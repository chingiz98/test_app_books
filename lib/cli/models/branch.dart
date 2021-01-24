import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:testapp/cli/models/commit.dart';

part 'branch.freezed.dart';
part 'branch.g.dart';

@freezed
abstract class Branch implements _$Branch {
  const Branch._();

  const factory Branch({
    @required String name,
    Commit commit,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  String get visibleName {
    var parts = [
      name,
    ];
    if (commit != null) {
      parts.add('(${commit.visibleName}');
    }

    return parts.join(' ');
  }
}
