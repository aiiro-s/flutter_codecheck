import 'package:flutter_codecheck/Controller/search_page_state.dart';
import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchPageNotifierProvider =
    StateNotifierProvider<SearchPageNotifier, AsyncValue<SearchPageState>>(
        (ref) {
  return SearchPageNotifier(ref.read(repoRepositoryProvider));
});

class SearchPageNotifier extends StateNotifier<AsyncValue<SearchPageState>> {
  SearchPageNotifier(this.repoRepository) : super(const AsyncLoading()) {
    init();
  }
  RepoRepository repoRepository;

  void init() {
    state = const AsyncData(
      SearchPageState(repository: Repository(total_count: 0, items: [])),
    );
  }

  Future<void> fetch(String keyword) async {
    final previosState = state.copyWithPrevious(state);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final data = await repoRepository.fetchByKeyword(keyword);
      return previosState.value!.copyWith(repository: data);
    });
  }
}
