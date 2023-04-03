// ignore_for_file: non_constant_identifier_names
// GitHubAPIの名前に合わせるため。

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'repository_owner.freezed.dart';
part 'repository_owner.g.dart';

@freezed
class RepositoryOwner with _$RepositoryOwner {
  const factory RepositoryOwner({
    required String? login,
    required String? avatar_url,
  }) = _RepositoryOwner;

  factory RepositoryOwner.fromJson(Map<String, Object?> json) =>
      _$RepositoryOwnerFromJson(json);
}
