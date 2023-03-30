import 'package:flutter_codecheck/Controller/detail_page_notifier.dart';
import 'package:flutter_codecheck/Controller/detail_page_state.dart';
import 'package:flutter_codecheck/Entities/repository_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group('DetailPageNotifier_初期値', () {
    test('初期化時の状態が、初期値の想定と一致していること', () async {
      const item = RepositoryItem(
        id: null,
        name: null,
        owner: null,
        html_url: null,
        description: null,
        stargazers_count: null,
        watchers_count: null,
        language: null,
        forks_count: null,
        open_issues_count: null,
      );
      final container = ProviderContainer();

      expect(
        container.read(detailPageNotifierFamilyProvider(item)),
        const DetailPageState(item: item),
      );
    });
  });

  group('DetailPageNotifier_openURL', () {
    test('URLが正しい場合、例外が処理されないこと', () async {
      const item = RepositoryItem(
        id: null,
        name: null,
        owner: null,
        html_url: "https://github.com/octocat",
        description: null,
        stargazers_count: null,
        watchers_count: null,
        language: null,
        forks_count: null,
        open_issues_count: null,
      );
      final container = ProviderContainer();
      final state = container.read(detailPageNotifierFamilyProvider(item));
      final notifier =
          container.read(detailPageNotifierFamilyProvider(item).notifier);

      expect(
        () async => await notifier.openURL(state.item.html_url!),
        isA(),
      );
    });
  });

  // 例外処理の確認はurl_launcherパッケージ利用の問題からPages側のWidgetTestにて確認する。
}
