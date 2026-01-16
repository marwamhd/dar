import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'add_edit_unit_screen.dart';

class UnitsScreen extends StatefulWidget {
  const UnitsScreen({super.key});

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  String selectedBuilding = 'الكل';
  String selectedStatus = 'الكل';

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
          'الشقق',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.textPrimary),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddEditUnitScreen(isEdit: false),
                ),
              );
            },
          ),
        ],
        
      ),
      body: Column(
        children: [
          // Filters
          Container(
            color: AppColors.primary,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: selectedBuilding,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(value: 'الكل', child: Text('كل المباني')),
                        DropdownMenuItem(value: 'مبنى النخيل', child: Text('مبنى النخيل')),
                        DropdownMenuItem(value: 'برج السلام', child: Text('برج السلام')),
                        DropdownMenuItem(value: 'مجمع الياسمين', child: Text('مجمع الياسمين')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedBuilding = value!;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: selectedStatus,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: const [
                        DropdownMenuItem(value: 'الكل', child: Text('كل الحالات')),
                        DropdownMenuItem(value: 'متاحة', child: Text('متاحة')),
                        DropdownMenuItem(value: 'مؤجرة', child: Text('مؤجرة')),
                        DropdownMenuItem(value: 'صيانة', child: Text('صيانة')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedStatus = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Units List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5, // مؤقتاً 5 شقق
              itemBuilder: (context, index) {
                return _buildUnitCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildUnitCard(int index) {
    // حالات مختلفة للشقق
    bool isAvailable = index % 3 == 0;
    bool isRented = index % 3 == 1;
    
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'شقة ${205 + index} - مبنى النخيل',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: const [
                        Icon(Icons.bed, size: 14, color: AppColors.textSecondary),
                        SizedBox(width: 4),
                        Text('2 غرف', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                        SizedBox(width: 12),
                        Icon(Icons.bathroom, size: 14, color: AppColors.textSecondary),
                        SizedBox(width: 4),
                        Text('2 حمام', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                        SizedBox(width: 12),
                        Icon(Icons.square_foot, size: 14, color: AppColors.textSecondary),
                        SizedBox(width: 4),
                        Text('120 م²', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: AppColors.textSecondary),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddEditUnitScreen(isEdit: true),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '400 د.ب / شهرياً',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isAvailable
                      ? Colors.green.withOpacity(0.1)
                      : isRented
                          ? Colors.red.withOpacity(0.1)
                          : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isAvailable ? Icons.check_circle : isRented ? Icons.home : Icons.build,
                      size: 14,
                      color: isAvailable ? Colors.green : isRented ? Colors.red : Colors.orange,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isAvailable ? 'متاحة' : isRented ? 'مؤجرة' : 'صيانة',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isAvailable ? Colors.green : isRented ? Colors.red : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}