import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add Firebase Firestore import
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop/components/list_tile/divider_list_tile.dart';
import 'package:shop/components/network_image_with_loader.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/approutes.dart';
import 'components/profile_card.dart';
import 'components/profile_menu_item_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current user from Firebase Auth
    User? user = FirebaseAuth.instance.currentUser;

    // Fetch user data from Firestore (example collection 'users')
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(user?.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show loading spinner while fetching data
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Handle errors
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('User data not found')); // Handle no data case
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;
          String name = userData['username'] ?? 'User Name'; // Default to 'User Name' if name is not available
          String email = userData['email'] ?? 'Email not available'; // Default email
          String imageSrc = userData['profile_picture'] ??
              'https://i.imgur.com/IXnwbLk.png'; // Default image if profile picture is not set

          return ListView(
            children: [
              ProfileCard(
                name: name,
                email: email,
                imageSrc: imageSrc,
                press: () {
                  Get.toNamed(AppRoutes.profileInfo);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding * 1.5),
                child: GestureDetector(
                  onTap: () {},
                  child: const AspectRatio(
                    aspectRatio: 1.8,
                    child: NetworkImageWithLoader("https://i.imgur.com/dz0BBom.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(
                  "Account",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              ProfileMenuListTile(
                text: "Orders",
                svgSrc: "assets/icons/Order.svg",
                press: () {
                  // Navigator.pushNamed(context, ordersScreenRoute);
                  // Get.toNamed(AppRoutes.orderScreen);
                },
              ),
              ProfileMenuListTile(
                text: "Returns",
                svgSrc: "assets/icons/Return.svg",
                press: () {},
              ),
              ProfileMenuListTile(
                text: "Wishlist",
                svgSrc: "assets/icons/Wishlist.svg",
                press: () {},
              ),
              ProfileMenuListTile(
                text: "Addresses",
                svgSrc: "assets/icons/Address.svg",
                press: () {
                  // Navigator.pushNamed(context, addressesScreenRoute);
                },
              ),
              ProfileMenuListTile(
                text: "Payment",
                svgSrc: "assets/icons/card.svg",
                press: () {
                  // Navigator.pushNamed(context, emptyPaymentScreenRoute);
                },
              ),
              ProfileMenuListTile(
                text: "Wallet",
                svgSrc: "assets/icons/Wallet.svg",
                press: () {
                  // Navigator.pushNamed(context, walletScreenRoute);
                  Get.toNamed(AppRoutes.walletScreen);
                },
              ),
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: Text(
                  "Personalization",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              DividerListTileWithTrilingText(
                svgSrc: "assets/icons/Notification.svg",
                title: "Notification",
                trilingText: "Off",
                press: () {
                  // Navigator.pushNamed(context, enableNotificationScreenRoute);
                },
              ),
              ProfileMenuListTile(
                text: "Preferences",
                svgSrc: "assets/icons/Preferences.svg",
                press: () {
                  // Navigator.pushNamed(context, preferencesScreenRoute);
                },
              ),
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              ProfileMenuListTile(
                text: "Location",
                svgSrc: "assets/icons/Location.svg",
                press: () {},
              ),
              const SizedBox(height: defaultPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: Text(
                  "Help & Support",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              ProfileMenuListTile(
                text: "Get Help",
                svgSrc: "assets/icons/Help.svg",
                press: () {
                  // Navigator.pushNamed(context, getHelpScreenRoute);
                },
              ),
              ProfileMenuListTile(
                text: "FAQ",
                svgSrc: "assets/icons/FAQ.svg",
                press: () {},
                isShowDivider: false,
              ),
              const SizedBox(height: defaultPadding),
              // Log Out
              ListTile(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((onValue) {
                    print("Signed Out");
                    Get.offAllNamed(AppRoutes.login);
                  });
                },
                minLeadingWidth: 24,
                leading: SvgPicture.asset(
                  "assets/icons/Logout.svg",
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    errorColor,
                    BlendMode.srcIn,
                  ),
                ),
                title: const Text(
                  "Log Out",
                  style: TextStyle(color: errorColor, fontSize: 14, height: 1),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
