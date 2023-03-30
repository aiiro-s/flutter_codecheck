import 'package:flutter_codecheck/Entities/repository_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'detail_page_state.freezed.dart';

@freezed
class DetailPageState with _$DetailPageState {
  const factory DetailPageState({
    required RepositoryItem item,
  }) = _DetailPageState;
}
