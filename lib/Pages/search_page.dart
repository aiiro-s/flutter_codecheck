import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key});
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repository Searcher'),
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
                  hintText: '検索したいキーワードを入力',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('RepositoryName',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    )),
                                Text('Repository Description...'),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Text('Langage:'),
                                    Text('dart'),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star),
                                        Text('2'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.watch),
                                        Text('2'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.fork_left),
                                        Text('2'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.fork_left),
                                        Text('2'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                              height: 16,
                              width: 16,
                              child: Icon(Icons.arrow_right)),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                  Text('Item 2'),
                  Text('Item 3'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
