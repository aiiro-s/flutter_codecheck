import 'package:flutter/material.dart';

class RepositoryItemInfoParts extends StatelessWidget {
  const RepositoryItemInfoParts(
      {super.key, required this.iconData, required this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(
          width: 4,
        ),
        Text(text),
      ],
    );
  }
}
