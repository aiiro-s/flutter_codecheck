import 'dart:convert';
import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../testdata/testdata.dart';

void main() {
  test('GitHubAPIのJSon変換確認', () async {
    const source = TestData.gitHubAPIJson;

    final json = jsonDecode(source);
    final repository = Repository.fromJson(json);

    expect(repository.total_count, 40);
    expect(repository.items, isNotEmpty);
    expect(repository.items?[0].id, 3081286);
    expect(repository.items?[0].name, "Tetris");
    expect(repository.items?[0].owner?.login, "dtrupenn");
    expect(repository.items?[0].owner?.avatar_url,
        "https://secure.gravatar.com/avatar/e7956084e75f239de85d3a31bc172ace?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png");
    expect(repository.items?[0].html_url, "https://github.com/dtrupenn/Tetris");
    expect(repository.items?[0].description,
        "A C implementation of Tetris using Pennsim through LC4");
    expect(repository.items?[0].stargazers_count, 1);
    expect(repository.items?[0].watchers_count, 1);
    expect(repository.items?[0].language, "Assembly");
    expect(repository.items?[0].forks_count, 0);
    expect(repository.items?[0].open_issues_count, 0);
  });
}
