// ignore_for_file: non_constant_identifier_names
// GitHubAPIの名前に合わせるため。

import 'package:flutter_codecheck/Entities/repository_owner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'repository_item.freezed.dart';
part 'repository_item.g.dart';

@freezed
class RepositoryItem with _$RepositoryItem {
  const factory RepositoryItem({
    required int? id,
    required String? name,
    required RepositoryOwner? owner,
    required String? html_url,
    required String? description,
    required int? stargazers_count,
    required int? watchers_count,
    required String? language,
    required int? forks_count,
    required int? open_issues,
  }) = _RepositoryItem;

  factory RepositoryItem.fromJson(Map<String, Object?> json) =>
      _$RepositoryItemFromJson(json);
}
