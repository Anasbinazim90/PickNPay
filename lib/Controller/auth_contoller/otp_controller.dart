import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  // Make otp a reactive list
  var otp = List.generate(6, (_) => "").obs;
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  void updateOtpValue(int index, String value) {
    if (value.isNotEmpty) {
      otp[index] = value; // Update the reactive variable
    } else {
      otp[index] = ""; // Clear the value if input is empty
    }
  }

  String getOtp() {
    return otp.join(); // Combine all otp values into a single string
  }
}
