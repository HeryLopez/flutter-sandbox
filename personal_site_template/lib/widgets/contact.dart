import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';
import 'package:personal_site_template/themes/theme_utils.dart';

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

    final styleMainText = theme.textTheme.titleLarge
        ?.copyWith(fontWeight: FontWeight.w600, height: 1.2, fontSize: 50);

    final styleButtonText =
        theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);

    final styleButton = FilledButton.styleFrom(
        backgroundColor: theme.colorScheme.defaultButtonColor);

    /*onPressed: onPressed, child: child).filledButtonTheme.style?.copyWith(
        foregroundColor: );*/

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(16),
          boxShadow: [ThemeUtils().getDefaultShadow(context)],
          color: theme.colorScheme.defaultBlockBackground),
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
                  style: styleButton,
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

  getDefaultShadow() {}
}
