import 'package:flutter/material.dart';
import 'package:flutter_codecheck/Controller/detail_page_notifier.dart';
import 'package:flutter_codecheck/Entities/repository_item.dart';
import 'package:flutter_codecheck/Widgets/repository_item_info_parts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.item});
  final RepositoryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(detailPageNotifierFamilyProvider(item));
    final notifier = ref.read(detailPageNotifierFamilyProvider(item).notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                state.owner != null
                    ? CircleAvatar(
                        backgroundImage: state.owner!.avatar_url != null
                            ? NetworkImage(state.owner!.avatar_url!)
                            : Image.asset('assets/images/noImage.png').image,
                        backgroundColor: Colors.white,
                      )
                    : CircleAvatar(
                        backgroundImage:
                            Image.asset('assets/images/noImage.png').image,
                        backgroundColor: Colors.white,
                      ),
                const SizedBox(width: 8),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      state.name ?? "-",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              state.description ?? "No description",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RepositoryItemInfoParts(
                  iconData: Icons.star_border,
                  text: state.stargazers_count != null
                      ? state.stargazers_count.toString()
                      : "0",
                ),
                const SizedBox(
                  width: 16,
                ),
                RepositoryItemInfoParts(
                  iconData: Icons.visibility,
                  text: state.watchers_count != null
                      ? state.watchers_count.toString()
                      : "0",
                ),
                const SizedBox(
                  width: 16,
                ),
                RepositoryItemInfoParts(
                  iconData: FontAwesomeIcons.codeFork,
                  text: state.forks_count != null
                      ? state.forks_count.toString()
                      : "0",
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'language',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(state.language ?? "-"),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'open issue count',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  state.open_issues_count != null
                      ? state.open_issues_count.toString()
                      : "0",
                ),
              ],
            ),
            const Divider(),
            const Text(
              'URL',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            state.html_url != null
                ? GestureDetector(
                    child: Text(
                      state.html_url!,
                      style: const TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () async {
                      try {
                        await notifier.openURL(state.html_url!);
                      } catch (e) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('エラー'),
                            content: const Text('URLが開けませんでした'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  )
                : const Text('リンクがありません'),
          ],
        ),
      ),
    );
  }
}
