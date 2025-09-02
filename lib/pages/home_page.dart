import 'package:flutter/material.dart';
import '../widgets/news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final news = List.generate(6, (i) => {
      'title': 'خبر ألعاب #${i+1}',
      'subtitle': 'ملخص قصير لخبر الألعاب الشهير - تفاصيل وتحديثات.',
      'image': 'assets/images/news.png'
    });

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: const Text('آخر الأخبار'),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.all(12.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                final n = news[i];
                return NewsCard(title: n['title']!, subtitle: n['subtitle']!, image: n['image']!);
              },
              childCount: news.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, mainAxisExtent: 240,
            ),
          ),
        ),
      ],
    );
  }
}
