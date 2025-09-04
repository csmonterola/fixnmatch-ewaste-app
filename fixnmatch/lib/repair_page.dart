import 'package:flutter/material.dart';

class RepairPage extends StatefulWidget {
  const RepairPage({Key? key}) : super(key: key);

  @override
  _RepairPageState createState() => _RepairPageState();
}

class _RepairPageState extends State<RepairPage> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  // Options
  final List<String> phoneBrands = ['Apple', 'Samsung', 'Google', 'OnePlus'];
  final List<String> repairTypes = [
    'Screen Repair',
    'Battery Replacement',
    'Software Issue',
  ];

  // Selected filters
  String? selectedPhoneBrand;
  String? selectedRepairType;

  @override
  Widget build(BuildContext context) {
    final Color darkBrown = const Color(0xFF4A3F35);
    final Color lightBrown = const Color(0xFFB08868);

    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text(
          "Repair",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      // Body with gradient like Dashboard
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
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView(
                children: [
                  // 🔎 Search section
                  sectionTitle("Search for Shops"),
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Enter phone brand/model',
                      helperText: 'E.g., iPhone 12, Samsung Galaxy S21',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ⚙️ Filters section
                  sectionTitle("Filters", subtitle: "Choose your preferences"),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      filterButton(
                        icon: Icons.phone_iphone,
                        label: 'Phone Brand',
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      filterButton(
                        icon: Icons.settings_suggest,
                        label: 'Repair Type',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      filterButton(
                        icon: Icons.attach_money,
                        label: 'Price Range',
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      filterButton(
                        icon: Icons.location_on,
                        label: 'Location',
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // 📱 Phone Brands
                  sectionTitle("Phone Brand"),
                  Wrap(
                    spacing: 8,
                    children: phoneBrands.map((brand) {
                      return ChoiceChip(
                        label: Text(brand),
                        selected: selectedPhoneBrand == brand,
                        onSelected: (selected) {
                          setState(() {
                            selectedPhoneBrand = selected ? brand : null;
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // 🔧 Repair Types
                  sectionTitle("Type of Repair"),
                  Wrap(
                    spacing: 8,
                    children: repairTypes.map((type) {
                      return ChoiceChip(
                        label: Text(type),
                        selected: selectedRepairType == type,
                        onSelected: (selected) {
                          setState(() {
                            selectedRepairType = selected ? type : null;
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 24),

                  // 📍 Location input
                  sectionTitle("Location"),
                  TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: 'Enter your city or zip code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: const Icon(Icons.location_on),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 Section Title Widget
  Widget sectionTitle(String title, {String? subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
        const SizedBox(height: 8),
      ],
    );
  }

  /// 🔹 Filter Button Widget
  Widget filterButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 6),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
