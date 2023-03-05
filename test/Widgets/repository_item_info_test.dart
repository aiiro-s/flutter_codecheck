import 'package:flutter/material.dart';
import 'package:flutter_codecheck/Widgets/repository_item_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('RepositoryItemInfoの表示確認', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: RepositoryItemInfo(
        name: 'name',
        description: 'description',
        forksCount: 1,
        language: 'language',
        onTap: () {},
        stargazersCount: 2,
        watchersCount: 3,
      ),
    ));

    final nameFinder = find.text('name');
    final descriptionFinder = find.text('description');
    final forksCountFinder = find.text('1');
    final languageFinder = find.text('language');
    final stargazersCountFinder = find.text('2');
    final watchersCountFinder = find.text('3');

    expect(nameFinder, findsOneWidget);
    expect(descriptionFinder, findsOneWidget);
    expect(forksCountFinder, findsOneWidget);
    expect(languageFinder, findsOneWidget);
    expect(stargazersCountFinder, findsOneWidget);
    expect(watchersCountFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    await tester.tap(nameFinder);
    expect(nameFinder, findsOneWidget); //Tapしても何も表示が変わらないこと
  });
}
