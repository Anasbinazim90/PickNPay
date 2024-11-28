import 'package:get/get.dart';
import 'dart:async';
import 'package:shop/route/screen_export.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToLanding();
  }

  void _navigateToLanding() {
    Timer(const Duration(seconds: 2), () {
      Get.off(() => OnboardingScreen());
    });
  }
}
