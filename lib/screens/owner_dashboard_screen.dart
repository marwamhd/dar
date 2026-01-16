import 'package:dar/screens/maintenance_screen.dart';
import 'package:dar/screens/owner_booking_requests_screen.dart';
import 'package:dar/screens/payments_screen.dart';
import 'package:dar/screens/units_screen.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'buildings_screen.dart';

class OwnerDashboardScreen extends StatelessWidget {
  const OwnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          'لوحة التحكم',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: AppColors.primary,
          child: Column(
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                color: AppColors.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: AppColors.secondary,
                      child: const Icon(
                        Icons.person,
                        size: 35,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'أحمد محمد',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'مالك عقارات',
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
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem(Icons.dashboard, 'لوحة التحكم', true, () {
                      Navigator.pop(context);
                    }),
                   _buildDrawerItem(Icons.apartment, 'المباني', false, () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BuildingsScreen(),
                        ),
                      );
                    }),
                    _buildDrawerItem(Icons.home, 'الشقق', false, () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UnitsScreen(),
                        ),
                      );
                    }),
                   _buildDrawerItem(Icons.pending_actions, 'طلبات الحجز', false, () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OwnerBookingRequestsScreen(),
                        ),
                      );
                    }),
                    _buildDrawerItem(Icons.pending_actions, 'المدفوعات', false, () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentsScreen(),
                        ),
                      );
                    }),
                    _buildDrawerItem(Icons.build, 'الصيانة', false, () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MaintenanceScreen(),
                        ),
                      );
                    }),
                    const Divider(color: AppColors.border),
                    _buildDrawerItem(Icons.person, 'الملف الشخصي', false, () {
                      Navigator.pop(context);
                      print('Navigate to Profile');
                    }),
                    _buildDrawerItem(Icons.logout, 'تسجيل الخروج', false, () {
                      Navigator.pop(context);
                      // سنضيف logout لاحقاً
                      print('Logout');
                    }, isLogout: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Welcome Message
          const Text(
            'مرحباً، أحمد 👋',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 24),
          
          // Stats Cards
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              _buildStatCard('إجمالي المباني', '3', Icons.apartment, Colors.blue),
              _buildStatCard('الشقق المؤجرة', '24/30', Icons.home, Colors.green),
              _buildStatCard('الدخل الشهري', '9,600 د.ب', Icons.attach_money, Colors.orange),
              _buildStatCard('طلبات معلقة', '5', Icons.pending_actions, Colors.red),
            ],
          ),
          const SizedBox(height: 24),
          
          // Quick Actions
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'إجراءات سريعة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildQuickActionButton(
                        'إضافة مبنى',
                        Icons.add_business,
                        () {
                          print('Add building');
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildQuickActionButton(
                        'إضافة شقة',
                        Icons.add_home,
                        () {
                          print('Add unit');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          /// Recent Activities
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'النشاطات الأخيرة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                _buildActivityItem(
                  Icons.pending_actions,
                  'طلب حجز جديد',
                  'شقة 205 - مبنى النخيل',
                  'منذ ساعتين',
                  Colors.orange,
                ),
                const Divider(color: AppColors.border),
                _buildActivityItem(
                  Icons.check_circle,
                  'دفعة مستلمة',
                  '400 د.ب - شقة 102',
                  'منذ 5 ساعات',
                  Colors.green,
                ),
                const Divider(color: AppColors.border),
                _buildActivityItem(
                  Icons.build,
                  'بلاغ صيانة',
                  'تسريب مياه - شقة 305',
                  'منذ يوم',
                  Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildQuickActionButton(String label, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.secondary, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildActivityItem(IconData icon, String title, String subtitle, String time, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDrawerItem(IconData icon, String title, bool isSelected, VoidCallback onTap, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : (isSelected ? AppColors.secondary : AppColors.textSecondary),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          color: isLogout ? Colors.red : (isSelected ? AppColors.secondary : AppColors.textPrimary),
        ),
      ),
      selected: isSelected,
      selectedTileColor: AppColors.background,
      onTap: onTap,
    );
  }
}