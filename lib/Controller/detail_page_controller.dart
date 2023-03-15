import 'package:flutter_codecheck/Entities/repository_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final detailPageControllerFamily = StateNotifierProvider.family<
    DetailPageController, RepositoryItem, RepositoryItem>((ref, item) {
  return DetailPageController(item);
});

class DetailPageController extends StateNotifier<RepositoryItem> {
  DetailPageController(this.item)
      : super(RepositoryItem(
          id: item.id,
          name: item.name,
          owner: item.owner,
          html_url: item.html_url,
          description: item.description,
          stargazers_count: item.stargazers_count,
          watchers_count: item.watchers_count,
          language: item.language,
          forks_count: item.forks_count,
          open_issues_count: item.open_issues_count,
        ));
  RepositoryItem item;

  Future<void> openURL(String url) async {
    final Uri url = Uri.parse(state.html_url!);
    if (!await launchUrl(url) || await canLaunchUrl(url)) {
      throw Exception();
    }
  }
}
