import 'package:dish_it/feature/auth/presentation/screens/change_lang_screen.dart';
import 'package:dish_it/feature/auth/presentation/screens/forget_pass_screen.dart';
import 'package:dish_it/feature/auth/presentation/screens/login_screen.dart';
import 'package:dish_it/feature/auth/presentation/screens/reset_pass_screen.dart';
import 'package:dish_it/feature/auth/presentation/screens/sent_key_screen.dart';
import 'package:dish_it/feature/auth/presentation/screens/singup_screen.dart';
import 'package:dish_it/feature/menu/presentation/screens/add_meal_screen.dart';
import 'package:dish_it/feature/menu/presentation/screens/menu_home_screen.dart';
import 'package:dish_it/feature/profile/presentation/screens/change_pass_screen.dart';
import 'package:dish_it/feature/profile/presentation/screens/profile_home_screen.dart';
import 'package:dish_it/feature/profile/presentation/screens/settings_screen.dart';
import 'package:dish_it/feature/profile/presentation/screens/update_profile_screen.dart';
import 'package:dish_it/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const profile = '/profile';
  static const sentKey = '/sentKey';
  static const restpass = '/restpass';
  static const changeLaguage = '/changeLaguage';
  static const changePass = '/changePass';
  static const addMeal = '/addMeal';
  static const menu = '/menu';
  static const settings = '/settings';
  static const updateProfile = '/updateProfile';
  static const forgetpassword = '/forgetpassword';
}

class AppRoutes {
  static Route<dynamic> generateAppRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.forgetpassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const ChefHomePage());
      case Routes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileHomeScreen());
      case Routes.sentKey:
        return MaterialPageRoute(builder: (_) => const SentKeyScreen());
      case Routes.restpass:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.changeLaguage:
        return MaterialPageRoute(builder: (_) => const ChangeLanguageScreen());
      case Routes.changePass:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.addMeal:
        return MaterialPageRoute(builder: (_) => const AddMealScreen());
      case Routes.menu:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Routes.updateProfile:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
        );
    }
  }
}
