
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/auth_contoller/signup_controller.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/approutes.dart';


class LoginScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-1.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/light-2.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Obx(() =>  Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade100))
                              ),
                              child:TextField(
                                controller: signupController.emailController,
                                onChanged: signupController.validateEmail,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    errorText: signupController.isEmailValid.value
                                        ? null
                                        : 'Enter a valid email',

                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),),
                            Obx(() => Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: signupController.passwordController,
                                onChanged: signupController.validatePassword,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                    errorText: signupController.isPasswordValid.value
                                        ? null
                                        : 'Password must be at least 6 characters',
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Get.toNamed(AppRoutes.forgotpasswordScreen);
                              },
                              child: Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),))

                        ],
                      ),
                      SizedBox(height: 30,),
                      GestureDetector(
                        onTap: () {
                          signupController.isLoading.value = true;
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                              email: signupController.emailController.text,
                              password: signupController.passwordController.text)
                              .then((result) async {
                            // Fetch user data from Firestore
                            var userData = await FirebaseFirestore.instance
                                .collection('users')
                                .doc(result.user?.uid)
                                .get();

                            if (userData.exists) {
                              signupController.isLoading.value = false;
                              print("Login Successful: ${userData.data()}");
                              Get.offAllNamed(AppRoutes.entrypoint);
                              Get.snackbar(
                                "Login Successful",
                                "Welcome back!",
                                snackPosition: SnackPosition.TOP,

                              );
                            } else {
                              print("User data not found");
                            }
                          }).catchError((error) {
                            signupController.isLoading.value = false;

                            // Show snackbar for errors
                            Get.snackbar(
                              "Error",
                              "Invalid Email or Password",
                              snackPosition: SnackPosition.TOP,

                            );
                            print("Error: $error");
                          });
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    primaryColor,
                                    // Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ]
                              )
                          ),
                          child: Center(
                            child: Obx(
                                  () => signupController.isLoading.value
                                  ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                                  : Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                          ),
                        ),
                      ),

                      SizedBox(height: 50.h,),
                      GestureDetector(
                          onTap: (){
                            Get.offAllNamed(AppRoutes.signup);
                          },
                          child: Text("Create Account", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)),

                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}



/// Fade Animation

