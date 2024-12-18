import 'package:flutter/material.dart';
import 'package:dish_it/core/utils/app_assets.dart';
import 'package:dish_it/core/utils/app_colors.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Menu', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () => item['onTap'](context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item['icon'],
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Example menu items
final List<Map<String, dynamic>> menuItems = [
  {
    'title': 'Recipes',
    'icon': AppAssets.meal,
    'onTap': (BuildContext context) {
      print('Navigating to Recipes');
      // Add navigation logic here
    },
  },
  {
    'title': 'Ingredients',
    'icon': AppAssets.meal,
    'onTap': (BuildContext context) {
      print('Navigating to Ingredients');
      // Add navigation logic here
    },
  },
  {
    'title': 'Favorites',
    'icon': AppAssets.meal,
    'onTap': (BuildContext context) {
      print('Navigating to Favorites');
      // Add navigation logic here
    },
  },
  {
    'title': 'Settings',
    'icon': AppAssets.meal,
    'onTap': (BuildContext context) {
      print('Navigating to Settings');
      // Add navigation logic here
    },
  },
];
