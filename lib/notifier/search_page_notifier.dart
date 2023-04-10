import 'package:flutter_codecheck/repository/repo_repository.dart';
import 'package:flutter_codecheck/entity/repository.dart';
import 'package:flutter_codecheck/notifier/search_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_page_notifier.g.dart';

@riverpod
class SearchPageNotifier extends _$SearchPageNotifier {
  @override
  FutureOr<SearchPageState> build() {
    return const SearchPageState(
      repository: Repository(total_count: 0, items: []),
    );
  }

  Future<void> fetch(String keyword) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repoRepository = ref.read(repoRepositoryProvider);
      final data = await repoRepository.fetchByKeyword(keyword);
      return SearchPageState(repository: data);
    });
  }
}
