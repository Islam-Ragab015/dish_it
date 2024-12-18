import 'package:dish_it/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_text_styile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryWhiteColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lock Image
              Image.asset(
                AppAssets.lock, // Ensure the correct path to lock.png
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 20),

              // Welcome Text
              Text(
                'Welcome Back!',
                style: boldStyle(
                  color: AppColors.primaryColor,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Please log in to continue',
                style: regularStyle(
                  color: AppColors.secondaryGreyColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),

              // Email Input Field
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.email, color: AppColors.primaryColor),
                  labelText: 'Email',
                  labelStyle: regularStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Password Input Field
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.lock, color: AppColors.primaryColor),
                  labelText: 'Password',
                  labelStyle: regularStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  print("Login Button Pressed");
                  // Add navigation or login logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Login',
                  style: boldStyle(
                    color: AppColors.secondaryWhiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Footer Text
              TextButton(
                onPressed: () {
                  print("Forgot Password Pressed");
                  // Add navigation to Forgot Password screen
                },
                child: Text(
                  'Forgot Password?',
                  style: regularStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
