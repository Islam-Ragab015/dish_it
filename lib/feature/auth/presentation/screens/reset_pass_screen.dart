import 'package:dish_it/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_text_styile.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Illustration or Icon
              Image.asset(
                AppAssets.lock, // Use the lock image for consistency
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                'Reset Password',
                style: boldStyle(
                  color: AppColors.primaryColor,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 10),

              // Description
              Text(
                'Enter your email address to receive a password reset link.',
                style: regularStyle(
                  color: AppColors.secondaryGreyColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
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
              const SizedBox(height: 30),

              // Reset Password Button
              ElevatedButton(
                onPressed: () {
                  print("Reset Password Pressed");
                  // Add reset password logic here
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
                  'Send Reset Link',
                  style: boldStyle(
                    color: AppColors.secondaryWhiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Back to Login Button
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context); // Navigate back to the previous screen
                },
                child: Text(
                  'Back to Login',
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
