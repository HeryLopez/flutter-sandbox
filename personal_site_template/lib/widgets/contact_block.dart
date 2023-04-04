import 'package:flutter/material.dart';
import 'package:personal_site_template/themes/extensions_theme.dart';
import 'package:personal_site_template/themes/theme_utils.dart';

class ContactBlock extends StatelessWidget {
  const ContactBlock(
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
        ?.copyWith(fontWeight: FontWeight.w900, height: 1.2, fontSize: 50);

    final styleButtonText = theme.textTheme.titleLarge
        ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white);

    final styleButton = FilledButton.styleFrom(
        backgroundColor: theme.colorScheme.defaultButtonColor);

    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [ThemeUtils().getDefaultShadow(context)],
          color: theme.colorScheme.defaultBlockBackground),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            messageText,
            overflow: TextOverflow.fade,
            maxLines: 2,
            style: styleMainText,
          ),
          const SizedBox(height: 16),
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
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: styleButtonText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  getDefaultShadow() {}
}
