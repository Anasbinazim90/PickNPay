import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/register_controller/register_controller.dart';
import 'package:shop/screens/checkout/components/default_button.dart';
import 'package:shop/screens/checkout/components/default_textfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  // Controllers for form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  // GlobalKey for form validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // Instantiate the PaymentController
    final PaymentController controller = Get.put(PaymentController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Integration'),
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Delivery.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.42,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DefaultTextFormFiled(
                              controller: firstNameController,
                              type: TextInputType.name,
                              hintText: 'First name',
                              prefix: Icons.person,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your first name!';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 10.h),
                          Expanded(
                            child: DefaultTextFormFiled(
                              controller: lastNameController,
                              type: TextInputType.name,
                              hintText: 'Last name',
                              prefix: Icons.person,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your last name!';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: 10.h),
                      DefaultTextFormFiled(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        hintText: 'Email',
                        prefix: Icons.email,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email!';
                          }
                          return null;
                        },
                      ),
                       SizedBox(height: 10.h),
                      DefaultTextFormFiled(
                        controller: phoneController,
                        type: TextInputType.number,
                        hintText: 'Phone',
                        prefix: Icons.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      DefaultTextFormFiled(
                        controller: priceController,
                        type: TextInputType.number,
                        hintText: "Price",
                        prefix: Icons.monetization_on,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your price!';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      DefaultButton(
                        buttonWidget: controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                            : const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            letterSpacing: 1.6,
                          ),
                        ),
                        function: () {
                          if (formKey.currentState!.validate()) {
                            controller.getOrderRegistrationID(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                              price: priceController.text,
                            );
                          }
                        },
                        width: MediaQuery.of(context).size.width,
                        radius: 10.0,

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
