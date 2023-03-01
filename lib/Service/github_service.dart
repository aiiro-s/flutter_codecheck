import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

final serviceProvider = Provider((ref) => GithubService());

class GithubService {
  Future<http.Response> repositoryFetch(String query) async {
    final response = await http
        .get(Uri.https('api.github.com', '/search/repositories', {'q': query}));
    return response;
  }
}
