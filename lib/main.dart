import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/route/approutes.dart';
import 'package:shop/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Template by The Flutter Way',
      theme: AppTheme.lightTheme(context),
      themeMode: ThemeMode.light,

      initialRoute: AppRoutes.onboarding,
      // home: SplashScreen(),
      getPages: AppRoutes.pages,
    );
  }
}
