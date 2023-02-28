// ignore_for_file: non_constant_identifier_names
// GitHubAPIの名前に合わせるため。

import 'package:flutter_codecheck/Entities/repository_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'repository.freezed.dart';
part 'repository.g.dart';

@freezed
class Repository with _$Repository {
  const factory Repository({
    required int? total_count,
    required List<RepositoryItem>? items,
  }) = _Repository;

  factory Repository.fromJson(Map<String, Object?> json) =>
      _$RepositoryFromJson(json);
}
