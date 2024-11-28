import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/cart_controller/cart_controller.dart';
import 'package:shop/route/approutes.dart';

class CheckoutCard extends StatelessWidget {
  CheckoutCard({super.key});

  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Price:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,   color: Colors.black,),
                ),
                Text(
                  "\$${cartController.totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(

                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            );
          }),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.registerScreen);
              // Implement checkout logic
              Get.snackbar(
                "Checkout",
                "Proceed to payment",
                snackPosition: SnackPosition.TOP,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child:  Text(
              "Proceed to Checkout",
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }
}
