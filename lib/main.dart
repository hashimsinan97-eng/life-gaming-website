import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/splash_page.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/community_page.dart';
import 'pages/chat_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(const EZApp());
}

class EZApp extends StatelessWidget {
  const EZApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EZGaming',
      debugShowCheckedModeBanner: false,
      theme: EZTheme.dark(context),
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      routes: {
        '/': (_) => const Shell(),
        '/splash': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
      },
      initialRoute: '/splash',
    );
  }
}

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int index = 0;
  final pages = const [
    HomePage(),
    CommunityPage(),
    ChatPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'الرئيسية'),
          NavigationDestination(icon: Icon(Icons.grid_on_outlined), label: 'المجتمع'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'الدردشة'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'البروفايل'),
          NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'الإعدادات'),
        ],
      ),
    );
  }
}
