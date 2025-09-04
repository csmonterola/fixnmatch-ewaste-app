import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard_page.dart';
import 'marketplace_page.dart';
import 'repair_page.dart';
import 'value_page.dart';


void main() {
  runApp(const FixMatchApp());
}

class FixMatchApp extends StatelessWidget {
  const FixMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // start with login page
      routes: {
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/marketplace': (context) => const MarketplacePage(),
         '/repair': (context) => const RepairPage(), 
         '/value': (context) => const ValuePage(), 
      },
    );
  }
}
