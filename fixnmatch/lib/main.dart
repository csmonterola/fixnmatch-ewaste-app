import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard_page.dart';
import 'marketplace_page.dart';

void main() {
  runApp(const FixMatchApp());
}

class FixMatchApp extends StatelessWidget {
  const FixMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fix & Match',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/marketplace': (context) => const MarketplacePage(),
      },
    );
  }
}