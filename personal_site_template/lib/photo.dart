import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  const Photo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'images/profile_image.jpg',
        height: 390,
        fit: BoxFit.cover,
      ),
    );
  }
}
