import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchPageControllerProvider =
    StateNotifierProvider<SearchPageController, Repository>((ref) {
  return SearchPageController(ref.read(repoRepositoryProvider));
});

class SearchPageController extends StateNotifier<Repository> {
  SearchPageController(this.repoRepository)
      : super(const Repository(total_count: 0, items: null));
  RepoRepository repoRepository;

  Future<Repository> fetch(String keyword) async {
    state = await repoRepository.fetchByKeyword(keyword);
    return state.copyWith();
  }
}
