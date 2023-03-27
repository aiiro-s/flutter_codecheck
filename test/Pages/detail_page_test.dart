import 'package:flutter/material.dart';
import 'package:flutter_codecheck/Controller/detail_page_notifier.dart';
import 'package:flutter_codecheck/Entities/repository_item.dart';
import 'package:flutter_codecheck/Entities/repository_owner.dart';
import 'package:flutter_codecheck/Pages/detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DetilPageの表示確認（null値）', (tester) async {
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

    await tester.pumpWidget(
      const MaterialApp(
        home: ProviderScope(
          child: DetailPage(item: item),
        ),
      ),
    );

    //AppBarがGitHub Repository Searcherであること
    expect(find.widgetWithText(AppBar, 'Detail'), findsOneWidget);

    //画面の固定文言が表示されていること
    expect(find.text('language'), findsOneWidget);
    expect(find.text('open issue count'), findsOneWidget);
    expect(find.text('URL'), findsOneWidget);

    //CircleAvatarが１つ表示されていること
    final circleAvatar = find.byType(CircleAvatar);
    expect(circleAvatar, findsOneWidget);

    //CircleAvatarの画像表示がnoImageで表示されていること
    expect(
        (circleAvatar.evaluate().first.widget as CircleAvatar).backgroundImage,
        Image.asset('assets/images/noImage.png').image);

    //nullの表示状態と一致していること
    expect(find.text('-'), findsNWidgets(2));
    expect(find.text("No description"), findsOneWidget);
    expect(find.text('0'), findsNWidgets(4));
    expect(find.text('リンクがありません'), findsOneWidget);
  });

  testWidgets('DetilPageの表示確認（ownerのURLがnull値）', (tester) async {
    const item = RepositoryItem(
      id: null,
      name: null,
      owner: RepositoryOwner(
        login: "login",
        avatar_url: null,
      ),
      html_url: null,
      description: null,
      stargazers_count: null,
      watchers_count: null,
      language: null,
      forks_count: null,
      open_issues_count: null,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: ProviderScope(
          child: DetailPage(item: item),
        ),
      ),
    );

    //CircleAvatarが１つ表示されていること
    final circleAvatar = find.byType(CircleAvatar);
    expect(circleAvatar, findsOneWidget);

    //CircleAvatarの画像表示がnoImageで表示されていること
    expect(
        (circleAvatar.evaluate().first.widget as CircleAvatar).backgroundImage,
        Image.asset('assets/images/noImage.png').image);
  });

  testWidgets('DetilPageの表示確認（値あり・URL部分は除く）', (tester) async {
    const item = RepositoryItem(
      id: 0,
      name: 'name',
      owner: RepositoryOwner(
        login: "login",
        avatar_url: null,
      ),
      html_url: "github.com/dtrupenn/Tetris",
      description: 'description',
      stargazers_count: 1,
      watchers_count: 2,
      language: 'dart',
      forks_count: 3,
      open_issues_count: 4,
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: ProviderScope(
          child: DetailPage(item: item),
        ),
      ),
    );

    // 描画待ち
    await tester.pumpAndSettle();

    //CircleAvatarが１つ表示されていること
    final circleAvatar = find.byType(CircleAvatar);
    expect(circleAvatar, findsOneWidget);

    //設定した表示状態と一致していること
    expect(find.text('name'), findsOneWidget);
    expect(find.text("description"), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('dart'), findsOneWidget);
    expect(find.text('github.com/dtrupenn/Tetris'), findsOneWidget);
  });

  testWidgets('DetilPageの表示確認（URLタップ時のエラー）', (tester) async {
    const item = RepositoryItem(
      id: 0,
      name: 'name',
      owner: RepositoryOwner(
        login: "login",
        avatar_url: null,
      ),
      html_url: "github.com/dtrupenn/Tetris",
      description: 'description',
      stargazers_count: 1,
      watchers_count: 2,
      language: 'dart',
      forks_count: 3,
      open_issues_count: 4,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ProviderScope(
          overrides: [
            detailPageNotifierFamilyProvider
                .overrideWithProvider(mockDetailPageControllerFamily),
          ],
          child: const DetailPage(item: item),
        ),
      ),
    );

    //CircleAvatarが１つ表示されていること
    final gestureDetector = find.byType(GestureDetector);
    expect(gestureDetector, findsOneWidget);
    await tester.tap(gestureDetector);

    //データ処理待ち
    await tester.pumpAndSettle();

    //エラーメッセージが表示されていることを確認
    expect(find.text('エラー'), findsOneWidget);
    expect(find.text('URLが開けませんでした'), findsOneWidget);
  });
}

// 例外用のMockクラスとProvider
final mockDetailPageControllerFamily = StateNotifierProvider.family<
    MockDetailPageController, RepositoryItem, RepositoryItem>((ref, item) {
  return MockDetailPageController(item);
});

class MockDetailPageController extends DetailPageNotifier {
  MockDetailPageController(super.item);

  @override
  Future<void> openURL(String url) async {
    throw Exception;
  }
}
