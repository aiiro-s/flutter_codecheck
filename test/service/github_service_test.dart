import 'package:flutter_codecheck/service/github_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() async {
  test('GitHubAPIのアクセス確認', () async {
    final service = GithubService();
    const query = 'Q';
    final response = await service.repositoryFetch(query);
    expect(response, isA<http.Response>());
    expect(response.statusCode, 200);
  });
}
