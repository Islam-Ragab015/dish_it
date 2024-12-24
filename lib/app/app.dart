import 'package:dish_it/core/routes/app_routes.dart';
import 'package:dish_it/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ChefApp extends StatelessWidget {
  const ChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.home,
      theme: AppTheme.getThemeData(),
      onGenerateRoute: AppRoutes.generateAppRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
