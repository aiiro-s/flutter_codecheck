import 'package:flutter/material.dart';
import 'package:flutter_codecheck/entity/repository_item.dart';
import 'package:flutter_codecheck/notifier/detail_page_notifier.dart';
import 'package:flutter_codecheck/component/repository_item_info_parts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.item});
  final RepositoryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(detailPageNotifierFamilyProvider(item));
    final notifier = ref.read(detailPageNotifierFamilyProvider(item).notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).detail_page_appBar_title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                state.item.owner != null
                    ? CircleAvatar(
                        backgroundImage: state.item.owner!.avatar_url != null
                            ? NetworkImage(state.item.owner!.avatar_url!)
                            : Image.asset('assets/images/noImage.png').image,
                        backgroundColor: Colors.white,
                      )
                    : CircleAvatar(
                        backgroundImage:
                            Image.asset('assets/images/noImage.png').image,
                        backgroundColor: Colors.white,
                      ),
                const SizedBox(width: 16),
                Flexible(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      state.item.name ?? "-",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              state.item.description ?? "No description",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RepositoryItemInfoParts(
                  iconData: Icons.star_border,
                  text: state.item.stargazers_count != null
                      ? state.item.stargazers_count.toString()
                      : "0",
                ),
                const SizedBox(
                  width: 16,
                ),
                RepositoryItemInfoParts(
                  iconData: Icons.visibility,
                  text: state.item.watchers_count != null
                      ? state.item.watchers_count.toString()
                      : "0",
                ),
                const SizedBox(
                  width: 16,
                ),
                RepositoryItemInfoParts(
                  iconData: FontAwesomeIcons.codeFork,
                  text: state.item.forks_count != null
                      ? state.item.forks_count.toString()
                      : "0",
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'language',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  state.item.language ?? "-",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'open issue count',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  state.item.open_issues_count != null
                      ? state.item.open_issues_count.toString()
                      : "0",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const Divider(),
            Text(
              'URL',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            state.item.html_url != null
                ? GestureDetector(
                    child: Text(
                      state.item.html_url!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    onTap: () async {
                      try {
                        await notifier.openURL(state.item.html_url!);
                      } catch (e) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              AppLocalizations.of(context).common_error,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            content: Text(
                              AppLocalizations.of(context)
                                  .detail_page_notOpenURL,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  AppLocalizations.of(context).common_ok,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  )
                : Text(
                    AppLocalizations.of(context).detail_page_notURL,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
          ],
        ),
      ),
    );
  }
}
