import 'package:flutter_codecheck/entity/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_page_state.freezed.dart';

@freezed
class SearchPageState with _$SearchPageState {
  const factory SearchPageState({
    required Repository repository,
  }) = _SearchPageState;
}
