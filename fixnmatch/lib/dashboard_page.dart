import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme colors
    final Color darkBrown = const Color(0xFF4A3F35);
    final Color lightBrown = const Color(0xFFB08868);

    /// Reusable Dashboard Button Widget
    Widget dashboardButton(
      IconData icon,
      String label,
      VoidCallback onTap,
    ) {
      return Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        elevation: 6,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon inside circle
                Container(
                  decoration: BoxDecoration(
                    color: darkBrown,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 32,
                  ),
                ),

                const SizedBox(height: 16),

                // Button label
                Text(
                  label,
                  style: TextStyle(
                    color: darkBrown,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 6,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 23, 23, 23)),
          onPressed: () {
            // Always go back to Login Page
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),

      // Body with gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [darkBrown, lightBrown],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                // Repair Button
                dashboardButton(
                  Icons.build,
                  'Repair',
                  () {
                    Navigator.pushNamed(context, '/repair');
                  },
                ),

                // Dispose Button
                dashboardButton(
                  Icons.delete_outline,
                  'Dispose',
                  () {
                    // TODO: Implement Dispose page
                  },
                ),

                // Value Button
                dashboardButton(
                  Icons.attach_money,
                  'Value',
                  () {
                    Navigator.pushNamed(context, '/value');
                  },
                ),

                // Marketplace Button
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
      ),
    );
  }
}
