import 'package:flutter/material.dart';
import '../constants/colors.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'المدفوعات',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.secondary,
          unselectedLabelColor: AppColors.textTertiary,
          indicatorColor: AppColors.secondary,
          isScrollable: true,
          tabs: const [
            Tab(text: 'الكل'),
            Tab(text: 'القادمة'),
            Tab(text: 'المتأخرة'),
            Tab(text: 'المدفوعة'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPaymentsList('all'),
          _buildPaymentsList('upcoming'),
          _buildPaymentsList('overdue'),
          _buildPaymentsList('paid'),
        ],
      ),
    );
  }

  Widget _buildPaymentsList(String type) {
    // عدد العناصر حسب النوع
    int itemCount = type == 'all' ? 6 : type == 'upcoming' ? 2 : type == 'overdue' ? 1 : 3;

    if (itemCount == 0) {
      return const Center(
        child: Text('لا توجد مدفوعات', style: TextStyle(color: AppColors.textTertiary)),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return _buildPaymentCard(type, index);
      },
    );
  }

  Widget _buildPaymentCard(String type, int index) {
    // تحديد الحالة والألوان
    bool isPaid = type == 'paid';
    bool isOverdue = type == 'overdue';
    bool isUpcoming = type == 'upcoming';
    
    Color statusColor = isPaid ? Colors.green : isOverdue ? Colors.red : Colors.orange;
    String statusText = isPaid ? 'مدفوعة' : isOverdue ? 'متأخرة' : 'قادمة';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'علي أحمد',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'شقة 205 - مبنى النخيل',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Payment Info
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'المبلغ',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '400 د.ب',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'تاريخ الاستحقاق',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textTertiary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${index + 1} مارس 2026',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Actions (إذا ما كانت مدفوعة)
          if (!isPaid) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _markAsPaid(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.green),
                      foregroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('وضع كمدفوعة'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      print('View invoice');
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.border),
                      foregroundColor: AppColors.textPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('عرض الفاتورة'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _markAsPaid(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الدفع'),
        content: const Text('هل تم استلام هذه الدفعة؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم تحديث حالة الدفعة!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }
}