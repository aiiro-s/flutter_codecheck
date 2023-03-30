import 'package:flutter_codecheck/Controller/detail_page_state.dart';
import 'package:flutter_codecheck/Entities/repository_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final detailPageNotifierFamilyProvider = StateNotifierProvider.family<
    DetailPageNotifier, DetailPageState, RepositoryItem>((ref, item) {
  return DetailPageNotifier(item);
});

class DetailPageNotifier extends StateNotifier<DetailPageState> {
  DetailPageNotifier(this.item) : super(DetailPageState(item: item));
  RepositoryItem item;

  Future<void> openURL(String url) async {
    final Uri url = Uri.parse(state.item.html_url!);
    if (!await launchUrl(url) || await canLaunchUrl(url)) {
      throw Exception();
    }
  }
}
