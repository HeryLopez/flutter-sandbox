import 'package:flutter/material.dart';

import '../themes/theme_utils.dart';

class PhotoBlock extends StatelessWidget {
  const PhotoBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [ThemeUtils().getDefaultShadow(context)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'images/profile_image.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
