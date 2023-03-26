import 'package:flutter/material.dart';

class InfoBlock extends StatelessWidget {
  const InfoBlock({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleTitle = theme.textTheme.displayMedium
        ?.copyWith(color: theme.colorScheme.onPrimary);

    final styleBody = theme.textTheme.headlineSmall
        ?.copyWith(color: theme.colorScheme.onPrimary);

    return Container(
      width: 210,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white10),
      child: Column(

        children: [
          Text(
            title,
            style: styleTitle,
          ),
          const SizedBox(height: 20),
          Text(
            body,
            style: styleBody,
          ),
        ],
      ),
    );
  }
}
