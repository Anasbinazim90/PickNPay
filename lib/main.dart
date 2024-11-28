import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/route/approutes.dart';
import 'package:shop/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/env/env_file.env");
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['API_KEY']!,
      appId: dotenv.env['APP_ID']!,
      messagingSenderId: dotenv.env['MESSAGING_SENDER_ID']!,
      projectId: dotenv.env['PROJECT_ID']!,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'PickNPay',
            theme: AppTheme.lightTheme(context),
            themeMode: ThemeMode.light,
            initialRoute: AppRoutes.splash_screen,
            // home: SplashScreen(),
            getPages: AppRoutes.pages,
          );
        });
  }
}
