import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact(
      {super.key,
      required this.messageText,
      required this.contactButtonText,
      required this.onContactPressed});

  final String messageText;
  final String contactButtonText;
  final VoidCallback onContactPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final styleMainText = theme.textTheme.displayMedium
        ?.copyWith(color: theme.colorScheme.onPrimary);

    final styleButtonText = theme.textTheme.headlineSmall
        ?.copyWith(color: theme.colorScheme.onPrimary);

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white10),
      child: Column(
        children: [
          Text(
            messageText,
            style: styleMainText,
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                  onPressed: onContactPressed,
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        contactButtonText,
                        style: styleButtonText,
                      ))),
            ],
          ),
        ],
      ),
    );
  }
}
