import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchPageControllerProvider =
    StateNotifierProvider<SearchPageController, AsyncValue<Repository>>((ref) {
  return SearchPageController(ref.read(repoRepositoryProvider));
});

class SearchPageController extends StateNotifier<AsyncValue<Repository>> {
  SearchPageController(this.repoRepository) : super(const AsyncLoading()) {
    init();
  }
  RepoRepository repoRepository;

  void init() async {
    state = const AsyncData(Repository(total_count: 0, items: []));
  }

  Future<void> fetch(String keyword) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final data = await repoRepository.fetchByKeyword(keyword);
      return data;
    });
  }
}
