import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color darkBrown = const Color(0xFF4A3F35);

    Widget dashboardButton(IconData icon, String label, VoidCallback onTap) {
      return Material(
        color: darkBrown,
        borderRadius: BorderRadius.circular(12),
        elevation: 5,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: Colors.white, size: 32),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: darkBrown,
        leading: BackButton(color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              dashboardButton(Icons.build, 'Repair', () {}),
              dashboardButton(Icons.delete_outline, 'Dispose', () {}),
              dashboardButton(Icons.attach_money, 'Value', () {}),
              dashboardButton(
                Icons.storefront,
                'Marketplace',
                () {
                  Navigator.pushNamed(context, '/marketplace');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}