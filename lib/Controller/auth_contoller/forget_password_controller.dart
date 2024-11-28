import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  var verificationCode = ''.obs; // Reactive verification code
  late PageController pageController; // PageController instance

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  void updateVerificationCode(String code) {
    verificationCode.value = code;
  }

  void goToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void onClose() {
    pageController.dispose(); // Dispose of the PageController
    super.onClose();
  }
}
