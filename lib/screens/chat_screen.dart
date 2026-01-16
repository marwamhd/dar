import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: const Text(
          'الرسائل',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.textPrimary),
            onPressed: () {
              print('New message');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3, // مؤقتاً 3 محادثات
        itemBuilder: (context, index) {
          return _buildChatItem();
        },
      ),
    );
  }

  Widget _buildChatItem() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.background,
          child: const Icon(
            Icons.apartment,
            color: AppColors.textTertiary,
          ),
        ),
        title: const Text(
          'مبنى النخيل - الإدارة',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: const Text(
          'شكراً لاستفسارك، الشقة متاحة للمعاينة',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textTertiary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Text(
          '10:30 ص',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textTertiary,
          ),
        ),
      ),
    );
  }
}