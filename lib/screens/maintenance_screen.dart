import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({super.key});

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
          'الصيانة',
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
          tabs: const [
            Tab(text: 'معلقة'),
            Tab(text: 'قيد المعالجة'),
            Tab(text: 'محلولة'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMaintenanceList('pending'),
          _buildMaintenanceList('in_progress'),
          _buildMaintenanceList('resolved'),
        ],
      ),
    );
  }

  Widget _buildMaintenanceList(String type) {
    int itemCount = type == 'pending' ? 3 : type == 'in_progress' ? 2 : 4;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return _buildMaintenanceCard(type, index);
      },
    );
  }

  Widget _buildMaintenanceCard(String type, int index) {
    bool isPending = type == 'pending';
    bool isInProgress = type == 'in_progress';
    bool isResolved = type == 'resolved';
    
    Color statusColor = isPending ? Colors.orange : isInProgress ? Colors.blue : Colors.green;
    String statusText = isPending ? 'معلقة' : isInProgress ? 'قيد المعالجة' : 'محلولة';
    
    // أنواع مشاكل مختلفة
    List<Map<String, dynamic>> issues = [
      {'title': 'تسريب مياه', 'icon': Icons.water_drop, 'priority': 'عاجل'},
      {'title': 'عطل في التكييف', 'icon': Icons.ac_unit, 'priority': 'عادي'},
      {'title': 'مشكلة في الكهرباء', 'icon': Icons.electrical_services, 'priority': 'عاجل'},
    ];
    
    var issue = issues[index % issues.length];
    bool isUrgent = issue['priority'] == 'عاجل';
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
        border: isUrgent && isPending
            ? Border.all(color: Colors.red, width: 2)
            : null,
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
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  issue['icon'],
                  color: statusColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          issue['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        if (isUrgent && isPending) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'عاجل',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ],
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
          const SizedBox(height: 12),
          
          // Description
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.person, size: 14, color: AppColors.textTertiary),
                    SizedBox(width: 6),
                    Text(
                      'علي أحمد',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.access_time, size: 14, color: AppColors.textTertiary),
                    SizedBox(width: 6),
                    Text(
                      'منذ 3 ساعات',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'يوجد تسريب في الحمام الرئيسي بحاجة لإصلاح عاجل',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          
          // Actions
          if (!isResolved) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  _showStatusDialog(context, isPending);
                },
                icon: const Icon(Icons.edit, size: 18),
                label: const Text('تغيير الحالة'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.secondary),
                  foregroundColor: AppColors.secondary,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showStatusDialog(BuildContext context, bool isPending) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تغيير الحالة'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isPending)
              ListTile(
                title: const Text('قيد المعالجة'),
                leading: const Icon(Icons.engineering, color: Colors.blue),
                onTap: () {
                  Navigator.pop(context);
                  _updateStatus(context, 'قيد المعالجة');
                },
              ),
            ListTile(
              title: const Text('محلولة'),
              leading: const Icon(Icons.check_circle, color: Colors.green),
              onTap: () {
                Navigator.pop(context);
                _updateStatus(context, 'محلولة');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _updateStatus(BuildContext context, String status) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم تغيير الحالة إلى: $status'),
        backgroundColor: Colors.green,
      ),
    );
  }
}