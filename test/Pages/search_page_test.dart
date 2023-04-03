import 'package:flutter/material.dart';
import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Entities/repository_item.dart';
import 'package:flutter_codecheck/Pages/search_page.dart';
import 'package:flutter_codecheck/Repository/repo_repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository_impl.dart';
import 'package:flutter_codecheck/Widgets/repository_item_info.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'search_page_test.mocks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@GenerateMocks([RepoRepositoryImpl])
void main() {
  testWidgets('SearchPageの初期表示確認', (tester) async {
    RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
        child: SearchPage(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
      locale: const Locale("ja"),
    ));

    //AppBarがGitHub Repository Searcherであること
    final appBarFinder =
        find.widgetWithText(AppBar, 'GitHub Repository Searcher');
    expect(appBarFinder, findsOneWidget);

    //初期表示で空の検索入力フィールドが表示されていること
    final textFieldFinder = find.widgetWithText(TextField, '');
    expect(textFieldFinder, findsOneWidget);

    //初期表示でListが表示されていないこと
    final listFinder = find.byType(RepositoryItemInfo);
    expect(listFinder, findsNothing);
  });

  testWidgets('SearchPageの検索操作（正常系:1件かつすべてnull値）', (tester) async {
    RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
    const totalCount = 0;
    final items = [
      const RepositoryItem(
        id: null,
        description: null,
        forks_count: null,
        html_url: null,
        language: null,
        name: null,
        open_issues_count: null,
        owner: null,
        stargazers_count: null,
        watchers_count: null,
      )
    ];
    when(repoRepository.fetchByKeyword('query')).thenAnswer(
        (_) async => Repository(total_count: totalCount, items: items));
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
        child: SearchPage(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
      locale: const Locale("ja"),
    ));

    //初期表示で空の検索入力フィールドを検索し、queryを入力し、tapする
    final textFieldFinder = find.widgetWithText(TextField, '');
    await tester.enterText(textFieldFinder, 'query');
    await tester.tap(find.byIcon(Icons.search));

    //データ処理待ち
    await tester.pumpAndSettle();

    // fetchByKeywordがちゃんと呼ばれていることを確認する。
    verify(repoRepository.fetchByKeyword('query')).called(1);

    //Listが1件表示されていること
    final listFinder = find.byType(RepositoryItemInfo);
    expect(listFinder, findsOneWidget);

    //null値が設定された場合に正しくWidgetが表示されていること
    final nameFinder = find.text('unknown');
    final descriptionFinder = find.text("no comment");
    final languageFinder = find.text('-');
    final countFinder = find.text('0');
    expect(nameFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
    expect(languageFinder, findsOneWidget);
    expect(countFinder, findsAtLeastNWidgets(3));
  });

  testWidgets('SearchPageの検索操作（正常系:1件かつすべて値あり）', (tester) async {
    RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
    const totalCount = 1;
    final items = [
      const RepositoryItem(
        id: 0,
        description: 'desc',
        forks_count: 0,
        html_url: '',
        language: 'lan',
        name: 'name',
        open_issues_count: 1,
        owner: null,
        stargazers_count: 2,
        watchers_count: 3,
      )
    ];
    when(repoRepository.fetchByKeyword('query')).thenAnswer(
        (_) async => Repository(total_count: totalCount, items: items));
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
        child: SearchPage(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
      locale: const Locale("ja"),
    ));

    //初期表示で空の検索入力フィールドを検索し、queryを入力し、tapする
    final textFieldFinder = find.widgetWithText(TextField, '');
    await tester.enterText(textFieldFinder, 'query');
    await tester.tap(find.byIcon(Icons.search));

    // fetchByKeywordがちゃんと呼ばれていることを確認する。
    verify(repoRepository.fetchByKeyword('query')).called(1);

    //データ処理待ち
    await tester.pumpAndSettle();

    //Listが1件表示されていること
    final listFinder = find.byType(RepositoryItemInfo);
    expect(listFinder, findsOneWidget);

    //取得された値が正しくWidgetが表示されていること
    final nameFinder = find.text('name');
    final descriptionFinder = find.text("desc");
    final languageFinder = find.text('lan');
    final forksCountFinder = find.text('0');
    final stargazersCountFinder = find.text('2');
    final watchersCountFinder = find.text('3');

    expect(nameFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
    expect(languageFinder, findsOneWidget);
    expect(forksCountFinder, findsOneWidget);
    expect(stargazersCountFinder, findsOneWidget);
    expect(watchersCountFinder, findsOneWidget);
  });

  testWidgets('SearchPageの検索操作（正常系:検索後0件）', (tester) async {
    RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
    const totalCount = 0;
    final List<RepositoryItem> items = [];
    when(repoRepository.fetchByKeyword('query')).thenAnswer(
        (_) async => Repository(total_count: totalCount, items: items));
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
        child: SearchPage(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
      locale: const Locale("ja"),
    ));

    //初期表示で空の検索入力フィールドを検索し、queryを入力し、tapする
    final textFieldFinder = find.widgetWithText(TextField, '');
    await tester.enterText(textFieldFinder, 'query');
    await tester.tap(find.byIcon(Icons.search));

    // fetchByKeywordがちゃんと呼ばれていることを確認する。
    verify(repoRepository.fetchByKeyword('query')).called(1);

    //データ処理待ち
    await tester.pumpAndSettle();

    //Listが表示されていないこと
    final listFinder = find.byType(RepositoryItemInfo);
    expect(listFinder, findsNothing);

    //検索結果が無かったことが表示されていること
    final resultFinder = find.text('検索結果がありませんでした');
    expect(resultFinder, findsOneWidget);
  });

  testWidgets('SearchPageの検索操作（例外処理：正常系例外）', (tester) async {
    RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
    when(repoRepository.fetchByKeyword('query'))
        .thenThrow(Exception('GitHubリポジトリの取得に失敗しました'));
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
        child: SearchPage(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
      locale: const Locale("ja"),
    ));

    //初期表示で空の検索入力フィールドを検索し、queryを入力し、tapする
    final textFieldFinder = find.widgetWithText(TextField, '');
    await tester.enterText(textFieldFinder, 'query');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // fetchByKeywordがちゃんと呼ばれていることを確認する。
    verify(repoRepository.fetchByKeyword('query')).called(1);

    //データ処理待ち
    await tester.pumpAndSettle();

    //Listが表示されていないこと
    final listFinder = find.byType(RepositoryItemInfo);
    expect(listFinder, findsNothing);

    //エラーメッセージが表示されていること
    final resultFinder = find.text('GitHubリポジトリの取得に失敗しました');
    expect(resultFinder, findsOneWidget);
  });

  testWidgets('SearchPageの検索操作（例外処理：異常終了）', (tester) async {
    RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
    when(repoRepository.fetchByKeyword('query')).thenThrow;
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
        child: SearchPage(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
      locale: const Locale("ja"),
    ));

    //初期表示で空の検索入力フィールドを検索し、queryを入力し、tapする
    final textFieldFinder = find.widgetWithText(TextField, '');
    await tester.enterText(textFieldFinder, 'query');
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // fetchByKeywordがちゃんと呼ばれていることを確認する。
    verify(repoRepository.fetchByKeyword('query')).called(1);

    //データ処理待ち
    await tester.pumpAndSettle();

    //Listが表示されていないこと
    final listFinder = find.byType(RepositoryItemInfo);
    expect(listFinder, findsNothing);

    //エラーメッセージが表示されていること
    final resultFinder = find.text('例外が発生しました。アプリを再起動して、再度確認してください。');
    expect(resultFinder, findsOneWidget);
  });

  testWidgets('SearchPageの入力操作（クリアボタン）', (tester) async {
    RepoRepositoryImpl repoRepository = MockRepoRepositoryImpl();
    await tester.pumpWidget(MaterialApp(
      home: ProviderScope(
        overrides: [
          repoRepositoryProvider.overrideWith((ref) => repoRepository)
        ],
        child: SearchPage(),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
        Locale('en'),
      ],
      locale: const Locale("ja"),
    ));

    //初期表示で空の検索入力フィールドを検索し、queryを入力する。
    final textFieldFinder = find.widgetWithText(TextField, '');
    await tester.enterText(textFieldFinder, 'query');
    await tester.pump();

    //queryの文字が入ったテキストフィールドが表示されていること
    final queryTextFieldFinder = find.widgetWithText(TextField, 'query');
    expect(queryTextFieldFinder, findsOneWidget);

    // clearボタンを押下し、文字列がクリアーされていること
    await tester.tap(find.byIcon(Icons.clear));
    await tester.pump();
    expect(find.widgetWithText(TextField, 'query'), findsNothing);
    expect(find.widgetWithText(TextField, ''), findsOneWidget);
  });
}
