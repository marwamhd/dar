import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/custom_button.dart';

class AddEditUnitScreen extends StatefulWidget {
  final bool isEdit;

  const AddEditUnitScreen({super.key, this.isEdit = false});

  @override
  State<AddEditUnitScreen> createState() => _AddEditUnitScreenState();
}

class _AddEditUnitScreenState extends State<AddEditUnitScreen> {
  final TextEditingController unitNumberController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  
  String selectedBuilding = 'مبنى النخيل';
  String selectedBedrooms = '2';
  String selectedBathrooms = '2';
  bool isFurnished = true;
  String selectedStatus = 'متاحة';
  List<String> selectedAmenities = ['تكييف', 'موقف'];

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      unitNumberController.text = '205';
      priceController.text = '400';
      areaController.text = '120';
    }
  }

  @override
  void dispose() {
    unitNumberController.dispose();
    priceController.dispose();
    areaController.dispose();
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
          widget.isEdit ? 'تعديل الشقة' : 'إضافة شقة جديدة',
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
               // Building Selection
                const Text(
                  'المبنى',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<String>(
                    value: selectedBuilding,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: const [
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
                const SizedBox(height: 20),
                
               // Unit Number
                const Text(
                  'رقم الشقة',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: unitNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'مثال: 205',
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
                
                // Bedrooms & Bathrooms
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'عدد الغرف',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton<String>(
                              value: selectedBedrooms,
                              isExpanded: true,
                              underline: const SizedBox(),
                              items: const [
                                DropdownMenuItem(value: 'استوديو', child: Text('استوديو')),
                                DropdownMenuItem(value: '1', child: Text('1')),
                                DropdownMenuItem(value: '2', child: Text('2')),
                                DropdownMenuItem(value: '3', child: Text('3')),
                                DropdownMenuItem(value: '4+', child: Text('4+')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedBedrooms = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'عدد الحمامات',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton<String>(
                              value: selectedBathrooms,
                              isExpanded: true,
                              underline: const SizedBox(),
                              items: const [
                                DropdownMenuItem(value: '1', child: Text('1')),
                                DropdownMenuItem(value: '2', child: Text('2')),
                                DropdownMenuItem(value: '3', child: Text('3')),
                                DropdownMenuItem(value: '4+', child: Text('4+')),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedBathrooms = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Area & Price
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'المساحة (م²)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: areaController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '120',
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
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'السعر (د.ب/شهرياً)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '400',
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
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Furnished
                const Text(
                  'نوع الشقة',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildTypeChip('مفروشة', isFurnished),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildTypeChip('غير مفروشة', !isFurnished),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

               // Status
                const Text(
                  'الحالة',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButton<String>(
                    value: selectedStatus,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: const [
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
                const SizedBox(height: 24),
                
               // Amenities
                const Text(
                  'المميزات',
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
                    _buildAmenityChip('تكييف'),
                    _buildAmenityChip('موقف'),
                    _buildAmenityChip('بلكونة'),
                    _buildAmenityChip('مطبخ مجهز'),
                    _buildAmenityChip('شامل الكهرباء'),
                    _buildAmenityChip('شامل الماء'),
                    _buildAmenityChip('إنترنت'),
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
              text: widget.isEdit ? 'حفظ التعديلات' : 'إضافة الشقة',
              onPressed: () {
                if (unitNumberController.text.isEmpty ||
                    priceController.text.isEmpty ||
                    areaController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('الرجاء تعبئة جميع الحقول المطلوبة'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(widget.isEdit
                        ? 'تم تحديث الشقة بنجاح!'
                        : 'تم إضافة الشقة بنجاح!'),
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
  Widget _buildTypeChip(String label, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          isFurnished = label == 'مفروشة';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : AppColors.background,
          border: Border.all(
            color: isSelected ? AppColors.secondary : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ),
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