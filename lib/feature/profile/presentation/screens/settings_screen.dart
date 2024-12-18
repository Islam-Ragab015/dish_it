import 'package:flutter/material.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_text_styile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSettingsOption(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                // Navigate to Notifications Settings
                print('Notifications Tapped');
              },
            ),
            _buildSettingsOption(
              context,
              icon: Icons.language,
              title: 'Change Language',
              onTap: () {
                // Navigate to Change Language Screen
                print('Change Language Tapped');
              },
            ),
            _buildSettingsOption(
              context,
              icon: Icons.privacy_tip,
              title: 'Privacy Settings',
              onTap: () {
                // Navigate to Privacy Settings Screen
                print('Privacy Settings Tapped');
              },
            ),
            _buildSettingsOption(
              context,
              icon: Icons.dark_mode,
              title: 'Theme Mode',
              onTap: () {
                // Navigate to Theme Mode Settings Screen
                print('Change Theme Mode Tapped');
              },
            ),
            const Divider(color: AppColors.secondaryGreyColor),
            _buildSettingsOption(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () {
                // Navigate to Help & Support Screen
                print('Help & Support Tapped');
              },
            ),
            _buildSettingsOption(
              context,
              icon: Icons.info,
              title: 'About',
              onTap: () {
                // Navigate to About Screen
                print('About Tapped');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        title,
        style: regularStyle(
          color: AppColors.secondaryBlackColor,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
