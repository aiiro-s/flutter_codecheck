import 'package:flutter_codecheck/Controller/search_page_controller.dart';
import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'search_page_controller_test.mocks.dart';

@GenerateMocks([RepoRepositoryImpl])
void main() async {
  group('fetch処理の確認', () {
    test('正常取得確認', () async {
      RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
      when(repoRepository.fetchByKeyword('query')).thenAnswer(
          (_) async => const Repository(total_count: 0, items: null));
      final searchPageController = SearchPageController(repoRepository);
      final state = await searchPageController.fetch('query');
      expect(state, const Repository(total_count: 0, items: null));
    });

    test('例外処理の確認', () async {
      RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
      when(repoRepository.fetchByKeyword('query'))
          .thenThrow(Exception('GitHubリポジトリの取得に失敗しました'));
      final searchPageController = SearchPageController(repoRepository);
      expect(() async => await searchPageController.fetch('query'),
          throwsException);
    });
  });
}
