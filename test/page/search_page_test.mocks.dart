// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_codecheck/test/page/search_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:flutter_codecheck/entity/repository.dart' as _i3;
import 'package:flutter_codecheck/repository/repo_repository_impl.dart' as _i4;
import 'package:flutter_codecheck/service/github_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGithubService_0 extends _i1.SmartFake implements _i2.GithubService {
  _FakeGithubService_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRepository_1 extends _i1.SmartFake implements _i3.Repository {
  _FakeRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RepoRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepoRepositoryImpl extends _i1.Mock
    implements _i4.RepoRepositoryImpl {
  MockRepoRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GithubService get service => (super.noSuchMethod(
        Invocation.getter(#service),
        returnValue: _FakeGithubService_0(
          this,
          Invocation.getter(#service),
        ),
      ) as _i2.GithubService);
  @override
  _i5.Future<_i3.Repository> fetchByKeyword(String? keyword) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchByKeyword,
          [keyword],
        ),
        returnValue: _i5.Future<_i3.Repository>.value(_FakeRepository_1(
          this,
          Invocation.method(
            #fetchByKeyword,
            [keyword],
          ),
        )),
      ) as _i5.Future<_i3.Repository>);
}
