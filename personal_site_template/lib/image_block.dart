import 'package:flutter/material.dart';

class ImageBlock extends StatelessWidget {
  const ImageBlock(
      {super.key,
      required this.path,
      required this.onBlockPressed,
      this.title});

  final String path;
  final VoidCallback onBlockPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final styleBody = theme.textTheme.labelLarge
        ?.copyWith(color: theme.colorScheme.onPrimary);
    return Container(
      height: 300,
      width: 300,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Image.asset(
                path,
                height: double.maxFinite,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onTap: onBlockPressed,
                    child: const SizedBox(
                      height: double.maxFinite,
                      width: double.maxFinite,
                    )),
              ),
              if (title != null)
                Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black54),
                    child: Text(
                      title!,
                      style: styleBody,
                    )),
            ],
          )),
    );
  }
}
