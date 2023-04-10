import 'package:flutter_codecheck/entity/repository_item.dart';
import 'package:flutter_codecheck/notifier/detail_page_state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'detail_page_notifier.g.dart';

@riverpod
class DetailPageNotifier extends _$DetailPageNotifier {
  @override
  DetailPageState build(RepositoryItem item) {
    return DetailPageState(item: item);
  }

  Future<void> openURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri) || await canLaunchUrl(uri)) {
      throw Exception();
    }
  }
}
