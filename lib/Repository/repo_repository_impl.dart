import 'dart:convert';
import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Service/github_service.dart';

class RepoRepositoryImpl {
  RepoRepositoryImpl(this.service);
  final GithubService service;

  Future<Repository> fetchByKeyword(String keyword) async {
    final response = await service.repositoryFetch(keyword);
    if (response.statusCode == 200 || response.statusCode == 304) {
      return Repository.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('GitHubリポジトリの取得に失敗しました');
    }
  }
}
