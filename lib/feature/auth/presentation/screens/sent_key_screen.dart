import 'package:dish_it/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_text_styile.dart';

class SentKeyScreen extends StatelessWidget {
  const SentKeyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Code'),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
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
                'Enter Verification Code',
                style: boldStyle(
                  color: AppColors.primaryColor,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 10),

              // Description
              Text(
                'We’ve sent a verification code to your email. Please enter it below to continue.',
                style: regularStyle(
                  color: AppColors.secondaryGreyColor,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Code Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: '*',
                        hintStyle: boldStyle(
                          color: AppColors.secondaryGreyColor,
                          fontSize: 24,
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: boldStyle(
                        color: AppColors.secondaryBlackColor,
                        fontSize: 24,
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 30),

              // Verify Button
              ElevatedButton(
                onPressed: () {
                  print("Verification Code Submitted");
                  // Add verification logic here
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
                  'Verify',
                  style: boldStyle(
                    color: AppColors.secondaryWhiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Resend Code Button
              TextButton(
                onPressed: () {
                  print("Resend Code");
                  // Add resend code logic here
                },
                child: Text(
                  'Resend Code',
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
