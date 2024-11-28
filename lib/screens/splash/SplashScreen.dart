import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/splash_controller/Splash_Controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController _controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logo/picknpay.png",
        ).animate().shimmer(color: Colors.white70, duration: 1500.ms),
      ),
    );
  }
}
