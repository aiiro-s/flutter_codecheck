import 'package:flutter_codecheck/Controller/search_page_notifier.dart';
import 'package:flutter_codecheck/Controller/search_page_state.dart';
import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'search_page_notifier_test.mocks.dart';

@GenerateMocks([RepoRepositoryImpl])
void main() async {
  group('SearchPageNotifier_初期値', () {
    test('初期化時の状態が、初期値の想定と一致していること', () async {
      RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
      final container = ProviderContainer(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
      );

      expect(
        container.read(searchPageNotifierProvider),
        const AsyncData(
          SearchPageState(repository: Repository(total_count: 0, items: [])),
        ),
      );
    });
  });

  group('SearchPageNotifier_fetchの確認', () {
    test('ローディング状態が正しく動作すること', () async {
      RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
      when(repoRepository.fetchByKeyword('query'))
          .thenAnswer((_) async => const Repository(total_count: 0, items: []));
      final container = ProviderContainer(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
      );

      final store = container.read(searchPageNotifierProvider.notifier);
      store.fetch('query');

      // 実行直後はローディング中の状態であること
      expect(
        container.read(searchPageNotifierProvider).isLoading,
        true,
      );
    });

    test('データ取得が正しく読み取れ、状態が更新されること', () async {
      RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
      when(repoRepository.fetchByKeyword('query'))
          .thenAnswer((_) async => const Repository(total_count: 1, items: []));
      final container = ProviderContainer(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository),
        ],
      );

      final store = container.read(searchPageNotifierProvider.notifier);
      await store.fetch('query');

      // ローディング状態が完了していること
      expect(
        container.read(searchPageNotifierProvider).isLoading,
        false,
      );
      // stateのrepositoryがMockから取得した値と一致していること
      expect(
        container.read(searchPageNotifierProvider).value,
        const SearchPageState(
          repository: Repository(total_count: 1, items: []),
        ),
      );
    });

    test('Exceptionの状態が正しくCatchできていること', () async {
      RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
      when(repoRepository.fetchByKeyword('query'))
          .thenThrow(Exception('GitHubリポジトリの取得に失敗しました'));
      final container = ProviderContainer(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
      );

      final store = container.read(searchPageNotifierProvider.notifier);
      await store.fetch('query');

      // stateのerror状態が例外処理をキャッチしていること
      expect(
        container.read(searchPageNotifierProvider).error,
        isA<Exception>(),
      );
    });
  });
}
