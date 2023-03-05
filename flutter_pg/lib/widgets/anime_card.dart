import 'package:flutter/material.dart';

class AnimeCard extends StatelessWidget {
  final String imageUrl;
  const AnimeCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
