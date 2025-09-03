import 'package:flutter/material.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  bool showDialogBox = false;

  @override
  Widget build(BuildContext context) {
    final Color darkBrown = const Color(0xFF4A3F35);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
        backgroundColor: darkBrown,
        leading: BackButton(color: Colors.white),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Marketplace Grid
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: List.generate(6, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        showDialogBox = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkBrown,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          size: 48,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Dialog box overlay
            if (showDialogBox)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => setState(() => showDialogBox = false),
                  child: Container(
                    color: Colors.black45,
                    child: Center(
                      child: GestureDetector(
                        onTap: () {}, // prevents tap propagation to close dialog
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Text Heading',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      setState(() {
                                        showDialogBox = false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text('Body text'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}