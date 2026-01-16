import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_button.dart';

class AddEditBuildingScreen extends StatefulWidget {
  final bool isEdit; // true = تعديل، false = إضافة

  const AddEditBuildingScreen({super.key, this.isEdit = false});

  @override
  State<AddEditBuildingScreen> createState() => _AddEditBuildingScreenState();
}

class _AddEditBuildingScreenState extends State<AddEditBuildingScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  List<String> selectedAmenities = ['مصعد', 'موقف سيارات'];

  @override
  void initState() {
    super.initState();
    // إذا كان تعديل، نحط البيانات الموجودة
    if (widget.isEdit) {
      nameController.text = 'مبنى النخيل';
      addressController.text = 'شارع الفاتح';
      cityController.text = 'المنامة';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.isEdit ? 'تعديل المبنى' : 'إضافة مبنى جديد',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Building Name
                const Text(
                  'اسم المبنى',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'مثال: مبنى النخيل',
                    hintStyle: const TextStyle(color: AppColors.textTertiary),
                    filled: true,
                    fillColor: AppColors.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Address
                const Text(
                  'العنوان',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: 'مثال: شارع الفاتح',
                    hintStyle: const TextStyle(color: AppColors.textTertiary),
                    filled: true,
                    fillColor: AppColors.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 20),
                
                // City
                const Text(
                  'المدينة',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    hintText: 'مثال: المنامة',
                    hintStyle: const TextStyle(color: AppColors.textTertiary),
                    filled: true,
                    fillColor: AppColors.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Amenities
                const Text(
                  'المرافق',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildAmenityChip('مصعد'),
                    _buildAmenityChip('موقف سيارات'),
                    _buildAmenityChip('حارس أمن'),
                    _buildAmenityChip('مولد كهرباء'),
                    _buildAmenityChip('حديقة'),
                    _buildAmenityChip('صالة رياضية'),
                  ],
                ),
              ],
            ),
          ),
          // Save Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              border: Border(
                top: BorderSide(color: AppColors.border, width: 1),
              ),
            ),
            child: CustomButton(
              text: widget.isEdit ? 'حفظ التعديلات' : 'إضافة المبنى',
              onPressed: () {
                if (nameController.text.isEmpty ||
                    addressController.text.isEmpty ||
                    cityController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('الرجاء تعبئة جميع الحقول'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(widget.isEdit
                        ? 'تم تحديث المبنى بنجاح!'
                        : 'تم إضافة المبنى بنجاح!'),
                    backgroundColor: Colors.green,
                  ),
                );

                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildAmenityChip(String amenity) {
    bool isSelected = selectedAmenities.contains(amenity);
    return InkWell(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedAmenities.remove(amenity);
          } else {
            selectedAmenities.add(amenity);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : AppColors.background,
          border: Border.all(
            color: isSelected ? AppColors.secondary : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              const Icon(Icons.check, size: 16, color: AppColors.primary),
            if (isSelected) const SizedBox(width: 4),
            Text(
              amenity,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}