// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:shop/constants.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({super.key});

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
//                         gradient: LinearGradient(colors: [
//                           Color(0xFF7B61FF),
//                           Color(0xFFD7D0FF),
//                         ]),
//                       ),
//                     ),
//                     // Back Button
//                     Positioned(
//                       top: MediaQuery.of(context).padding.top + 10,
//                       left: 10,
//                       child: IconButton(
//                         icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           ///////// ****** Glass Effect with Forgot Password UI ****** ///////////
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Forgot Password",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25,
//                     color: Colors.white),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   textAlign: TextAlign.center,
//                   "Enter your email address to reset your password",
//                   style: TextStyle(fontSize: 14, color: Colors.white),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 200,
//                 width: double.infinity,
//                 margin: const EdgeInsets.symmetric(horizontal: 30),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white),
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white.withOpacity(0.1),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaY: 20, sigmaX: 20),
//                     child: Padding(
//                       padding: const EdgeInsets.all(25),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Spacer(),
//                           const Text(
//                             "Email",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                                 color: Colors.white),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextFormField(
//                             decoration: InputDecoration(
//                               prefixIcon: const Icon(Icons.email,
//                                   color: Color(0xFF7B61FF)),
//                               hintText: 'Email',
//                               filled: true,
//                               fillColor: Colors.white.withOpacity(0.5),
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(color: Colors.white),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                     color: Color(0xFF7B61FF), width: 2.0),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                               border: OutlineInputBorder(
//                                 borderSide:
//                                 const BorderSide(color: Color(0xFF7B61FF)),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             keyboardType: TextInputType.emailAddress,
//                             style: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize:
//                                 12), // Customize text style if needed
//                           ),
//                           const Spacer(),
//                           Container(
//                             height: 40,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                                 color: primaryColor,
//                                 borderRadius: BorderRadius.circular(30)),
//                             alignment: Alignment.center,
//                             child: const Text("Reset Password",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                   color: Colors.white,
//                                 )),
//                           ),
//                           const Spacer(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: LogoWithTitle(
        title: 'Forgot Password',
        subText: "Enter your email address to reset your password",
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone, color: Color(0xFF7B61FF)),
                  hintText: 'Phone Number',
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF7B61FF)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF7B61FF)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12), // Customize text style if needed
              ),
            ),
          ),
          ElevatedButton(
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
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}

class LogoWithTitle extends StatelessWidget {
  final String title, subText;
  final List<Widget> children;

  const LogoWithTitle(
      {super.key,
      required this.title,
      this.subText = '',
      required this.children});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.1),
              SvgPicture.asset(
                "assets/logo/picknpay.svg",
                colorFilter: ColorFilter.mode(
                    Theme.of(context).iconTheme.color!, BlendMode.srcIn),
                height: 50,
                width: 100,
              ),
              SizedBox(
                height: constraints.maxHeight * 0.1,
                width: double.infinity,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  subText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.64),
                  ),
                ),
              ),
              ...children,
            ],
          ),
        );
      }),
    );
  }
}
