import 'package:flutter/material.dart';
import 'package:flutter_codecheck/Controller/detail_page_controller.dart';
import 'package:flutter_codecheck/Entities/repository_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.item});
  final RepositoryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(detailPageControllerFamily(item));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.abc),
                Text(state.name ?? ""),
              ],
            ),
            Text(state.description ?? ""),
          ],
        ),
      ),
    );
  }
}
