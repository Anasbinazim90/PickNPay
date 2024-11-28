import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(user?.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading state
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error fetching user data'));
          }
          if (!snapshot.data!.exists) {
            return Center(child: Text('User data not found'));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;

          String name = userData['username'] ?? 'Name not available';
          String email = userData['email'] ?? 'Email not available';
          String phone = userData['phone'] ?? 'Phone not available';
          String location = userData['location'] ?? 'Location not available';
          String profileImage = userData['profile_picture'] ??
              'https://i.postimg.cc/cCsYDjvj/user-2.png';

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ProfilePic(image: profileImage),
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Divider(height: 16.0 * 2),
                Info(infoKey: "User ID", info: "@${user?.email}"),
                Info(infoKey: "Location", info: location),
                Info(infoKey: "Phone", info: phone),
                Info(infoKey: "Email Address", info: email),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 48),
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        // Add profile edit functionality here
                      },
                      child: const Text("Edit profile"),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.08),
        ),
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.infoKey,
    required this.info,
  });

  final String infoKey, info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            infoKey,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.8),
            ),
          ),
          Text(info),
        ],
      ),
    );
  }
}
