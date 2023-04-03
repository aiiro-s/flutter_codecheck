import 'package:flutter_codecheck/entity/repository.dart';
import 'package:flutter_codecheck/repository/repo_repository_impl.dart';
import 'package:flutter_codecheck/service/github_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repoRepositoryProvider = Provider<RepoRepositoryImpl>(
    (ref) => RepoRepositoryImpl(ref.read(serviceProvider)));

abstract class RepoRepository {
  Future<Repository> fetchByKeyword(String keyword);
}
