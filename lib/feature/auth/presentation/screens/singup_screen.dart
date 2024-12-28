import 'package:dish_it/core/locale/app_locale.dart';
import 'package:dish_it/core/utils/app_assets.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_strings.dart';
import 'package:dish_it/core/utils/app_text_styile.dart';
import 'package:dish_it/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                // Welcome Section with Gradient Background
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
                      // const SizedBox(height: 20),
                      // Welcome Text
                      Text(
                        AppStrings.createAccount.tr(context),
                        style: boldStyle(
                          color: AppColors.primaryColor,
                          fontSize: isSmallScreen ? 28 : 32,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppStrings.signupAccess.tr(context),
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

                // Name Input Field
                CustomTextFormField(
                  label: AppStrings.name.tr(context),
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterName.tr(context);
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

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
                const SizedBox(height: 20),

                // Password Input Field
                CustomTextFormField(
                  label: AppStrings.password.tr(context),
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.pleaseEnterValidPassword.tr(context);
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                ElevatedButton(
                  onPressed: () {},
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
                    "Sign Up",
                    style: boldStyle(
                      color: AppColors.secondaryWhiteColor,
                      fontSize: isSmallScreen ? 16 : 18,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Already have an account? Login Text
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to Login Screen
                    },
                    child: Text(
                      AppStrings.alreadyHaveAccount.tr(context),
                      style: regularStyle(
                        color: AppColors.primaryColor,
                        fontSize: isSmallScreen ? 14 : 16,
                      ),
                    ),
                  ),
                ),

                // Divider with Text
                _buildDividerWithText(context, isSmallScreen),
                const SizedBox(height: 20),

                // Social Media Signup Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppAssets.googleLogo,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppAssets.facebookLogo,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDividerWithText(BuildContext context, bool isSmallScreen) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.primaryColor.withAlpha(76),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            AppStrings.or.tr(context),
            style: regularStyle(
              color: AppColors.primaryColor.withAlpha(153),
              fontSize: isSmallScreen ? 16 : 18,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColors.primaryColor.withAlpha(76),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
