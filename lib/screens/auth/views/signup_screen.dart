// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shop/constants.dart';
// import 'package:shop/route/approutes.dart';
// import 'package:shop/route/screen_export.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           /////////// ******* BackGround Section ****** //////////
//           Column(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Stack(
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.vertical(),
//                         gradient: LinearGradient(colors: [
//                           Color(0xFF7B61FF),
//                           Color(0xFFD7D0FF),
//                         ]),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           ///////// ****** Glass Effect with Sign-Up UI ****** ///////////
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 100),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Create Your Account",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25,
//                         color: Colors.white),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       "Signup with your details or continue with social media",
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     height: 600,
//                     width: double.infinity,
//                     margin: const EdgeInsets.symmetric(horizontal: 30),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white.withOpacity(0.1),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child: BackdropFilter(
//                           filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
//                           child: Padding(
//                             padding: const EdgeInsets.all(25),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Center(
//                                     child: Text(
//                                   "Sign Up",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 22,
//                                       color: Colors.white),
//                                 )),
//                                 const Spacer(),
//                                 const Text(
//                                   "Username",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                       color: Colors.white),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     prefixIcon: const Icon(Icons.person,
//                                         color: Color(0xFF7B61FF)),
//                                     hintText: 'Username',
//                                     filled: true,
//                                     fillColor: Colors.white.withOpacity(0.5),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide:
//                                           const BorderSide(color: Colors.white),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF), width: 2.0),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF)),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize:
//                                           12), // Customize text style if needed
//                                 ),
//                                 const Spacer(),
//                                 const Text(
//                                   "Email",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                       color: Colors.white),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     prefixIcon: const Icon(Icons.email,
//                                         color: Color(0xFF7B61FF)),
//                                     hintText: 'Email',
//                                     filled: true,
//                                     fillColor: Colors.white.withOpacity(0.5),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide:
//                                           const BorderSide(color: Colors.white),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF), width: 2.0),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF)),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   keyboardType: TextInputType.emailAddress,
//                                   style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize:
//                                           12), // Customize text style if needed
//                                 ),
//                                 const Spacer(),
//                                 const Text(
//                                   "Phone Number",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                       color: Colors.white),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     prefixIcon: const Icon(Icons.phone,
//                                         color: Color(0xFF7B61FF)),
//                                     hintText: 'Phone Number',
//                                     filled: true,
//                                     fillColor: Colors.white.withOpacity(0.5),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide:
//                                           const BorderSide(color: Colors.white),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF), width: 2.0),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF)),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                   ),
//                                   keyboardType: TextInputType.phone,
//                                   style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize:
//                                           12), // Customize text style if needed
//                                 ),
//                                 const Spacer(),
//                                 const Text(
//                                   "Password",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                       color: Colors.white),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     prefixIcon: const Icon(Icons.lock,
//                                         color: Color(0xFF7B61FF)),
//                                     hintText: 'Password',
//                                     filled: true,
//                                     fillColor: Colors.white.withOpacity(0.5),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide:
//                                           const BorderSide(color: Colors.white),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF), width: 2.0),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF)),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: const Icon(
//                                         Icons.visibility_off,
//                                         color: Color(0xFF7B61FF),
//                                       ),
//                                       onPressed: () {},
//                                     ),
//                                   ),
//                                   obscureText: true,
//                                   keyboardType: TextInputType.visiblePassword,
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 const Spacer(),
//                                 const Text(
//                                   "Confirm Password",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                       color: Colors.white),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     prefixIcon: const Icon(Icons.lock,
//                                         color: Color(0xFF7B61FF)),
//                                     hintText: 'Confirm Password',
//                                     filled: true,
//                                     fillColor: Colors.white.withOpacity(0.5),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide:
//                                           const BorderSide(color: Colors.white),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF), width: 2.0),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     border: OutlineInputBorder(
//                                       borderSide: const BorderSide(
//                                           color: Color(0xFF7B61FF)),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: const Icon(
//                                         Icons.visibility_off,
//                                         color: Color(0xFF7B61FF),
//                                       ),
//                                       onPressed: () {},
//                                     ),
//                                   ),
//                                   obscureText: true,
//                                   keyboardType: TextInputType.visiblePassword,
//                                   style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 const Spacer(),
//                                 Container(
//                                   height: 40,
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                       color: primaryColor,
//                                       borderRadius: BorderRadius.circular(30)),
//                                   alignment: Alignment.center,
//                                   child: const Text("Sign Up",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                         color: Colors.white,
//                                       )),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Text(
//                                       "Already have an account ? ",
//                                       style: TextStyle(
//                                           color: Colors.white, fontSize: 12),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         Get.offAllNamed(AppRoutes.login);
//                                       },
//                                       child: const Text(
//                                         "Log In",
//                                         style: TextStyle(
//                                           color: primaryColor,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const Spacer(),
//                               ],
//                             ),
//                           )),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Continue with",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           CircleAvatar(
//                             radius: 20.0, // Adjust the size as needed
//                             backgroundColor: Colors.white.withOpacity(0.5),
//                             child: ClipOval(
//                               child: Image.network(
//                                 "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Fsearch%20(2).png?alt=media&token=24a918f7-3564-4290-b7e4-08ff54b3c94c",
//                                 width: 20.0, // Adjust the image size as needed
//                                 height: 20.0,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           CircleAvatar(
//                             radius: 20.0, // Adjust the size as needed
//                             backgroundColor: Colors.white.withOpacity(0.5),
//                             child: ClipOval(
//                               child: Image.network(
//                                 "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Ffacebook%20(2).png?alt=media&token=9c275bf0-2bf7-498a-9405-9ae99df8d8f2",
//                                 width: 23.0, // Adjust the image size as needed
//                                 height: 23.0,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           CircleAvatar(
//                             radius: 20.0, // Adjust the size as needed
//                             backgroundColor: Colors.white.withOpacity(0.5),
//                             child: ClipOval(
//                               child: Image.network(
//                                 "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/socials%2Fapple-black-logo.png?alt=media&token=c44581fa-6fd2-4ae2-bd85-18bfbe6386d2",
//                                 width: 23.0, // Adjust the image size as needed
//                                 height: 23.0,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/route/approutes.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.08),
                SvgPicture.asset(
                  "assets/logo/picknpay.svg",
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                  height: 50,
                  width: 100,
                ),
                SizedBox(height: constraints.maxHeight * 0.08),
                Text(
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person,
                              color: Color(0xFF7B61FF)),
                          hintText: 'Username',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF7B61FF)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF7B61FF)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12), // Customize text style if needed
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.email, color: Color(0xFF7B61FF)),
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF7B61FF)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF7B61FF)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12), // Customize text style if needed
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.phone, color: Color(0xFF7B61FF)),
                          hintText: 'Phone Number',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF7B61FF)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF7B61FF)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12), // Customize text style if needed
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.lock, color: Color(0xFF7B61FF)),
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF7B61FF)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF7B61FF)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.visibility_off,
                              color: Color(0xFF7B61FF),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color(0xFF7B61FF),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Sign Up"),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.login);
                        },
                        child: Text.rich(
                          const TextSpan(
                            text: "Already have an account? ",
                            children: [
                              TextSpan(
                                text: "Sign in",
                                style: TextStyle(color: Color(0xFF7B61FF)),
                              ),
                            ],
                          ),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

// only for demo
List<DropdownMenuItem<String>>? countries = [
  "Bangladesh",
  "Switzerland",
  'Canada',
  'Japan',
  'Germany',
  'Australia',
  'Sweden',
].map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(value: value, child: Text(value));
}).toList();
