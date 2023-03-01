import 'dart:convert';
import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository.dart';
import 'package:flutter_codecheck/Service/github_service.dart';

class RepoRepositoryImpl implements RepoRepository {
  RepoRepositoryImpl(this.service);
  final GithubService service;

  @override
  Future<Repository> fetchByKeyword(String keyword) async {
    final response = await service.repositoryFetch(keyword);
    if (response.statusCode == 200 || response.statusCode == 304) {
      return Repository.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('GitHubリポジトリの取得に失敗しました');
    }
  }
}
