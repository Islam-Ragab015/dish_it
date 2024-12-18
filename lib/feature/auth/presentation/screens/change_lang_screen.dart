import 'package:flutter/material.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_text_styile.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String _selectedLanguage = 'English'; // Default language

  final List<String> _languages = [
    'English',
    'العَرَبيَّة',
  ];

  void _changeLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });

    // Add logic to persist language choice or update app locale
    print('Language changed to: $language');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Language'),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Select your preferred language:',
              style: boldStyle(
                color: AppColors.secondaryBlackColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  final language = _languages[index];
                  return ListTile(
                    title: Text(
                      language,
                      style: regularStyle(
                        color: AppColors.secondaryBlackColor,
                        fontSize: 16,
                      ),
                    ),
                    trailing: _selectedLanguage == language
                        ? const Icon(
                            Icons.check,
                            color: AppColors.primaryColor,
                          )
                        : null,
                    onTap: () => _changeLanguage(language),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Confirm language change logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text('Language changed to $_selectedLanguage'),
                    ),
                  );
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
                  'Save Changes',
                  style: boldStyle(
                    color: AppColors.secondaryWhiteColor,
                    fontSize: 18,
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
