import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('تسجيل الدخول', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(controller: email, decoration: const InputDecoration(labelText: 'البريد الإلكتروني')),
            const SizedBox(height: 12),
            TextField(controller: pass, obscureText: true, decoration: const InputDecoration(labelText: 'كلمة المرور')),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                setState(() => loading = true);
                await Future.delayed(const Duration(seconds: 1));
                if (!mounted) return;
                setState(() => loading = false);
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text(loading ? '...جاري' : 'دخول (تجريبي)'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Text('تسجيل عبر Google (لاحقًا)'),
            )
          ],
        ),
      ),
    );
  }
}
