import 'package:flutter/material.dart';
import 'package:flutter_codecheck/Controller/search_page_notifier.dart';
import 'package:flutter_codecheck/Pages/detail_page.dart';
import 'package:flutter_codecheck/Providers/color_theme_provider.dart';
import 'package:flutter_codecheck/Widgets/repository_item_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(searchPageNotifierProvider);
    final store = ref.watch(searchPageNotifierProvider.notifier);
    final themeState = ref.watch(colorThemeProvider);
    final themeNotifier = ref.watch(colorThemeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).search_page_appBar_title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: themeState == true
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
            tooltip: AppLocalizations.of(context).search_page_appBar_tooltip,
            onPressed: () {
              themeNotifier.state = !themeNotifier.state;
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)
                      .search_page_textField_hintText,
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      await store.fetch(_searchController.text);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          asyncState.when(
              data: (state) => Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: state.repository.items.isNotEmpty
                          ? ListView.builder(
                              itemCount: state.repository.items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return RepositoryItemInfo(
                                  name: state.repository.items[index].name ??
                                      "unknown",
                                  description: state.repository.items[index]
                                          .description ??
                                      "no comment",
                                  language:
                                      state.repository.items[index].language ??
                                          "-",
                                  stargazersCount: state.repository.items[index]
                                          .stargazers_count ??
                                      0,
                                  watchersCount: state.repository.items[index]
                                          .watchers_count ??
                                      0,
                                  forksCount: state.repository.items[index]
                                          .forks_count ??
                                      0,
                                  onTap: () async {
                                    await Navigator.of(context).push<void>(
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                          item: state.repository.items[index],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : Text(
                              AppLocalizations.of(context)
                                  .search_page_no_result,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                    ),
                  ),
              error: (Object error, StackTrace stackTrace) {
                if (error.toString() == 'Exception: GitHubリポジトリの取得に失敗しました') {
                  return Text(
                    AppLocalizations.of(context).search_page_search_error,
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                } else {
                  return Text(
                    AppLocalizations.of(context).common_exception,
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                }
              },
              loading: () {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
