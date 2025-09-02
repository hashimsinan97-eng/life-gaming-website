import 'package:flutter/material.dart';
import '../theme.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final friends = const [
    {'id': 1, 'name': 'PlayerOne'},
    {'id': 2, 'name': 'GamerX'},
  ];
  final messages = <Map<String, String>>[];
  final input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدردشة')),
      body: Column(
        children: [
          SizedBox(
            height: 72,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(12),
              itemBuilder: (_, i) => Chip(
                label: Text(friends[i]['name']!),
                avatar: const CircleAvatar(backgroundImage: AssetImage('assets/images/avatar.png')),
              ),
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemCount: friends.length,
            ),
          ),
          const Divider(height: 1, color: EZTheme.border),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (_, i) => Align(
                alignment: messages[i]['from'] == 'me' ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: messages[i]['from'] == 'me' ? EZTheme.blue.withOpacity(0.15) : EZTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: EZTheme.border),
                  ),
                  child: Text(messages[i]['text']!, style: const TextStyle(color: EZTheme.text)),
                ),
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: TextField(controller: input, decoration: const InputDecoration(hintText: 'اكتب رسالة…'))),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (input.text.trim().isEmpty) return;
                      setState(() {
                        messages.add({'from': 'me', 'text': input.text.trim()});
                        input.clear();
                      });
                    },
                    child: const Icon(Icons.send),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
