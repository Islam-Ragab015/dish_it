import 'package:dish_it/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:dish_it/core/utils/app_colors.dart';
import 'package:dish_it/core/utils/app_text_styile.dart';

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.secondaryGreyColor,
                backgroundImage:
                    AssetImage(AppAssets.logo), // Replace with your asset
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'islam', // Replace with dynamic user name
                style: boldStyle(
                  color: AppColors.secondaryBlackColor,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'islam@example.com', // Replace with dynamic user email
                style: regularStyle(
                  color: AppColors.secondaryGreyColor,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(color: AppColors.secondaryGreyColor),
            const SizedBox(height: 10),
            _buildProfileOption(
              context,
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {
                // Navigate to Edit Profile Screen
                print('Edit Profile Tapped');
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {
                // Navigate to Change Password Screen
                print('Change Password Tapped');
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.settings,
              title: 'Change Settings',
              onTap: () {
                // Navigate to Change Language Screen
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () {
                // Handle logout logic
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(
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

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            'Log Out',
            style: boldStyle(
              color: AppColors.secondaryBlackColor,
              fontSize: 18,
            ),
          ),
          content: Text(
            'Are you sure you want to log out?',
            style: regularStyle(
              color: AppColors.secondaryBlackColor,
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                'Cancel',
                style: boldStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                // Add logout logic here
                print('User logged out');
              },
              child: Text(
                'Log Out',
                style: boldStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
