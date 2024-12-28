import 'package:dish_it/core/locale/app_locale.dart';
import 'package:dish_it/core/utils/app_assets.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_strings.dart';
import 'package:dish_it/core/utils/app_text_styile.dart';
import 'package:dish_it/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryWhiteColor,
        body: Center(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Reset Password Section with Gradient Background
                Container(
                  width: isSmallScreen ? double.infinity : size.width * 0.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.secondaryGreyColor.withAlpha(200),
                        AppColors.secondaryWhiteColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(50),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // Lock Icon
                      Image.asset(
                        AppAssets.lock,
                        height: 100,
                        width: 100,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 20),
                      // Reset Password Text
                      Text(
                        AppStrings.sendResetLink.tr(context),
                        style: boldStyle(
                          color: AppColors.primaryColor,
                          fontSize: isSmallScreen ? 28 : 32,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppStrings.sendResetLinkInfo.tr(context),
                        textAlign: TextAlign.center,
                        style: regularStyle(
                          color: AppColors.primaryColor,
                          fontSize: isSmallScreen ? 16 : 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Email Input Field
                CustomTextFormField(
                  label: AppStrings.email.tr(context),
                  prefixIcon: Icons.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterValidEmail.tr(context);
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Submit Button for Password Reset
                ElevatedButton(
                  onPressed: () {
                    // Implement the password reset functionality
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 8,
                    backgroundColor: AppColors.primaryColor,
                    shadowColor: AppColors.primaryColor.withAlpha(100),
                  ),
                  child: Text(
                    AppStrings.submit.tr(context),
                    style: boldStyle(
                      color: AppColors.secondaryWhiteColor,
                      fontSize: isSmallScreen ? 16 : 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Back to Login Text
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to Login Screen
                    },
                    child: Text(
                      AppStrings.backToLogin.tr(context),
                      style: regularStyle(
                        color: AppColors.primaryColor,
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
