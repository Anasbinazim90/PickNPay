import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  // Observables
  var isLoading = false.obs;

  // Example method to simulate getting a token
  Future<void> getAuthToken() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulated API call
    isLoading.value = false;
    Get.snackbar(
      'Success',
      'Auth token received!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  Future<void> getOrderRegistrationID({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulated API call
    isLoading.value = false;

    // Navigate to ToggleScreen on success
    // Get.to(() => const ToggleScreen());
  }
}
