import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            value: true,
            onChanged: (v) {},
            title: const Text('الوضع الليلي'),
            subtitle: const Text('مفعل افتراضيًا'),
          ),
          ListTile(
            title: const Text('تعديل الحساب'),
            trailing: const Icon(Icons.chevron_left),
            onTap: () {},
          ),
          ListTile(
            title: const Text('تسجيل الخروج'),
            trailing: const Icon(Icons.logout),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
