import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/route/approutes.dart';
import 'package:shop/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Template by The Flutter Way',
      theme: AppTheme.lightTheme(context),
      // Dark theme is inclided in the Full template
      themeMode: ThemeMode.light,

      initialRoute: AppRoutes.onboarding,
      // home: SplashScreen(),

      getPages: AppRoutes.pages,
      // onGenerateRoute: router.generateRoute,
      // initialRoute: onbordingScreenRoute,
    );
  }
}
