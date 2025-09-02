import 'package:flutter/material.dart';
import '../theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('البروفايل')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/images/avatar.png')),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('لاعب مجهول', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('FPS • RPG • Sports', style: TextStyle(color: EZTheme.muted)),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          const Text('النبذة', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('اكتب نبذة عن نفسك هنا…', style: TextStyle(color: EZTheme.muted)),
          const SizedBox(height: 16),
          const Text('منشوراتي', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 6, mainAxisSpacing: 6,
            ),
            itemBuilder: (_, i) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/clip.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
