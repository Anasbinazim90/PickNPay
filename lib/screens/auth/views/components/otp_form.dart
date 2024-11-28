import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/auth_contoller/otp_controller.dart';

class OtpForm extends StatelessWidget {
  final Function(String) callBack;

  OtpForm({super.key, required this.callBack});

  final OtpController otpController = Get.find<OtpController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) {
        return Obx(() {
          return Expanded(
            child: SizedBox(
              height: 50.h,
              width: MediaQuery.of(context).size.width / 10,
              child: TextFormField(
                focusNode: otpController.focusNodes[index],
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  otpController.updateOtpValue(index, value);
                  if (otpController.getOtp().length == 6) {
                    callBack(otpController.getOtp());
                  }
                  if (value.isNotEmpty && index < 5) {
                    FocusScope.of(context).nextFocus();
                  } else if (value.isEmpty && index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                keyboardType: TextInputType.number,
                maxLength: 1,
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                textAlign: TextAlign.center,
                initialValue: otpController.otp[index],
              ),
            ),
          );
        });
      }),
    );
  }
}
