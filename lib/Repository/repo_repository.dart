import 'package:flutter_codecheck/Entities/repository.dart';
import 'package:flutter_codecheck/Repository/repo_repository_impl.dart';
import 'package:flutter_codecheck/Service/github_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repoRepositoryProvider = Provider<RepoRepository>(
    (ref) => RepoRepositoryImpl(ref.read(serviceProvider)));

abstract class RepoRepository {
  Future<Repository> fetchByKeyword(String keyword);
}
