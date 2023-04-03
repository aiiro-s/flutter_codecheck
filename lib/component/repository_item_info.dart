import 'package:flutter/material.dart';
import 'package:flutter_codecheck/component/repository_item_info_parts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RepositoryItemInfo extends StatelessWidget {
  const RepositoryItemInfo({
    super.key,
    required this.name,
    required this.description,
    required this.language,
    required this.stargazersCount,
    required this.watchersCount,
    required this.forksCount,
    required this.onTap,
  });

  final String name;
  final String description;
  final String language;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          'Langage:',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          language,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        RepositoryItemInfoParts(
                          iconData: Icons.star_border,
                          text: stargazersCount.toString(),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        RepositoryItemInfoParts(
                          iconData: Icons.visibility,
                          text: watchersCount.toString(),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        RepositoryItemInfoParts(
                          iconData: FontAwesomeIcons.codeFork,
                          text: forksCount.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
                width: 16,
                child: Icon(Icons.navigate_next),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }
}
