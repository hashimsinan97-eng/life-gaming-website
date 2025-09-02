import 'package:flutter/material.dart';
import '../theme.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const NewsCard({super.key, required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(image, fit: BoxFit.cover, height: 140),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text(subtitle, style: const TextStyle(color: EZTheme.muted), maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
