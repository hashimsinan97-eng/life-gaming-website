import 'package:flutter/material.dart';
import '../theme.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final posts = [
    {'author': 'PlayerOne', 'text': 'أجمل لقطة اليوم!', 'media': 'assets/images/clip.png', 'likes': 12},
    {'author': 'GamerX', 'text': 'نصيحة: جرّب إعدادات الحساسية 6', 'media': 'assets/images/clip.png', 'likes': 5},
  ];

  final textCtrl = TextEditingController();
  final mediaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المجتمع')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Card(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(controller: textCtrl, decoration: const InputDecoration(hintText: 'اكتب منشورًا…')),
                    const SizedBox(height: 8),
                    TextField(controller: mediaCtrl, decoration: const InputDecoration(hintText: 'رابط صورة (اختياري)')),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        onPressed: () {
                            if (textCtrl.text.trim().isEmpty) return;
                            setState(() {
                              posts.insert(0, {
                                'author': 'أنا',
                                'text': textCtrl.text.trim(),
                                'media': 'assets/images/clip.png',
                                'likes': 0,
                              });
                              textCtrl.clear();
                              mediaCtrl.clear();
                            });
                        },
                        child: const Text('نشر'),
                      ),
                    ),
                  ],
                ),
            ),
          ),
          const SizedBox(height: 8),
          ...posts.map((p) => Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png')),
                  title: Text(p['author'] as String),
                  subtitle: const Text('قبل قليل'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(p['text'] as String, style: const TextStyle(color: EZTheme.muted)),
                ),
                const SizedBox(height: 8),
                Image.asset(p['media'] as String, fit: BoxFit.cover, height: 180),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(onPressed: (){}, icon: const Icon(Icons.thumb_up_alt_outlined), label: Text('${p['likes']} إعجاب')),
                    TextButton.icon(onPressed: (){}, icon: const Icon(Icons.mode_comment_outlined), label: const Text('تعليق')),
                    TextButton.icon(onPressed: (){}, icon: const Icon(Icons.share_outlined), label: const Text('مشاركة')),
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
