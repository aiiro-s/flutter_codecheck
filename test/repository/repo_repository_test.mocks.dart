// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_codecheck/test/repository/repo_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_codecheck/service/github_service.dart' as _i3;
import 'package:http/http.dart' as _i2;
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

class _FakeResponse_0 extends _i1.SmartFake implements _i2.Response {
  _FakeResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GithubService].
///
/// See the documentation for Mockito's code generation for more information.
class MockGithubService extends _i1.Mock implements _i3.GithubService {
  MockGithubService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Response> repositoryFetch(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #repositoryFetch,
          [query],
        ),
        returnValue: _i4.Future<_i2.Response>.value(_FakeResponse_0(
          this,
          Invocation.method(
            #repositoryFetch,
            [query],
          ),
        )),
      ) as _i4.Future<_i2.Response>);
}
