import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  // مؤقتاً: true = عنده شقة، false = ما عنده شقة
  final bool hasActiveRental = true;

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          hasActiveRental ? 'شقتي' : 'الرئيسية',
          style: const TextStyle(
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
      body: hasActiveRental ? _buildActiveTenantView(context) : _buildEmptyStateView(context),
    );
  }

  // Empty State (اللي سويناه قبل)
  Widget _buildEmptyStateView(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.home_outlined,
                size: 50,
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'ما عندك شقة مستأجرة',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'تصفح الشقق المتاحة وابدأ رحلتك\nفي البحث عن بيتك المثالي',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'تصفح الشقق',
              onPressed: () {
                print('Navigate to Browse');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Active Tenant View (جديد)
  Widget _buildActiveTenantView(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Current Apartment Card
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
                'شقتك الحالية',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'شقة 205 - مبنى النخيل',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Icon(Icons.location_on, size: 16, color: AppColors.textTertiary),
                  SizedBox(width: 4),
                  Text(
                    'المنامة، البحرين',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textTertiary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        
       // Rent Countdown
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              const Text(
                '15',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'يوم متبقي للدفعة القادمة',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        
        // Action Buttons
        CustomButton(
          text: 'دفع الإيجار',
          onPressed: () {
            print('Pay rent');
          },
        ),
        const SizedBox(height: 12),
        CustomButton(
          text: 'الإبلاغ عن مشكلة',
          onPressed: () {
            print('Report issue');
          },
          isPrimary: false,
        ),
        const SizedBox(height: 24),
        
        // Contract Details
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
                'تفاصيل العقد',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              _buildContractRow('الإيجار الشهري', '400 د.ب'),
              const SizedBox(height: 12),
              _buildContractRow('تاريخ البداية', '1 يناير 2026'),
              const SizedBox(height: 12),
              _buildContractRow('تاريخ النهاية', '31 ديسمبر 2026'),
            ],
          ),
        ),
      ],
    );
  }
  Widget _buildContractRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textTertiary,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}