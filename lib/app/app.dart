import 'package:dish_it/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: Routes.home,
      onGenerateRoute: AppRoutes.generateAppRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
