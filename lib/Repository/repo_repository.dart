import 'package:flutter_codecheck/Entities/repository.dart';

abstract class RepoRepository {
  Future<Repository> fetchByKeyword(String keyword);
}
