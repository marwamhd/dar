import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Profile Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              border: Border(
                bottom: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: Column(
              children: [
                // Avatar
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.background,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: AppColors.textTertiary,
                  ),
                ),
                const SizedBox(height: 16),
                // Name
                const Text(
                  'أحمد محمد',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                // Email
                const Text(
                  'ahmed@example.com',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          // Menu Items
          Expanded(
            child: Container(
              color: AppColors.primary,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMenuItem(Icons.edit, 'تعديل الملف الشخصي'),
                  _buildMenuItem(Icons.favorite, 'المفضلة'),
                  _buildMenuItem(Icons.history, 'سجل الحجوزات'),
                  _buildMenuItem(Icons.settings, 'الإعدادات'),
                  _buildMenuItem(Icons.help, 'المساعدة والدعم'),
                  _buildMenuItem(Icons.logout, 'تسجيل الخروج', isLogout: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMenuItem(IconData icon, String title, {bool isLogout = false}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isLogout ? Colors.red : AppColors.textSecondary,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            color: isLogout ? Colors.red : AppColors.textPrimary,
          ),
        ),
        trailing: Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: AppColors.textTertiary,
        ),
        onTap: () {
          print('Tapped: $title');
        },
      ),
    );
  }
}