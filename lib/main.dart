import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'screens/splash_screen.dart';
import 'screens/role_selection_screen.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const DarApp());
}

class DarApp extends StatelessWidget {
  const DarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.secondary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.secondary,
          primary: AppColors.secondary,
        ),
      ),
      home: const SplashScreen(),
      // home: const RoleSelectionScreen(),
      // home: const MainScreen(),

    );
  }
}