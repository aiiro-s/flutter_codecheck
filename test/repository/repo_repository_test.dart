import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository_impl.dart';
import 'package:flutter_codecheck/Service/github_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import '../testdata/testdata.dart';
import 'repo_repository_test.mocks.dart';

@GenerateMocks([GithubService])
void main() async {
  group('gitHubRepository取得時の確認', () {
    test('ステータスコード200の正常確認', () async {
      final GithubService service = MockGithubService();
      const String query = 'Q';
      when(service.repositoryFetch(query))
          .thenAnswer((_) async => http.Response(TestData.gitHubAPIJson, 200));
      final repoRepositoryImpl = RepoRepositoryImpl(service);
      final response = await repoRepositoryImpl.fetchByKeyword(query);
      expect(response, isA<Repository>());
    });

    test('ステータスコード304の正常確認', () async {
      final GithubService service = MockGithubService();
      const String query = 'Q';
      when(service.repositoryFetch(query))
          .thenAnswer((_) async => http.Response(TestData.gitHubAPIJson, 304));
      final repoRepositoryImpl = RepoRepositoryImpl(service);
      final response = await repoRepositoryImpl.fetchByKeyword(query);
      expect(response, isA<Repository>());
    });

    test('ステータスコード422での例外確認', () async {
      final GithubService service = MockGithubService();
      const String query = 'Q';
      when(service.repositoryFetch(query))
          .thenAnswer((_) async => http.Response(TestData.gitHubAPIJson, 422));

      final repoRepositoryImpl = RepoRepositoryImpl(service);
      expect(() async => await repoRepositoryImpl.fetchByKeyword(query),
          throwsException);
    });
  });
}
