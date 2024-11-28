import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // PageController to control the PageView
  final PageController pageController = PageController();

  // Reactive variables
  final RxInt pageIndex = 0.obs;

  // Onboarding data
  final List<Onboard> onboardingData = [
    Onboard(
      image: "assets/Illustration/Illustration-0.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
      title: "Find the item you’ve \nbeen looking for",
      description:
          "Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience.",
    ),
    Onboard(
      image: "assets/Illustration/Illustration-1.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
      title: "Get those shopping \nbags filled",
      description:
          "Add any item you want to your cart, or save it on your wishlist, so you don’t miss it in your future purchases.",
    ),
    Onboard(
      image: "assets/Illustration/Illustration-2.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
      title: "Fast & secure \npayment",
      description: "There are many payment options available for your ease.",
    ),
    Onboard(
      image: "assets/Illustration/Illustration-3.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_3.png",
      title: "Package tracking",
      description:
          "In particular, Shoplon can pack your orders, and help you seamlessly manage your shipments.",
    ),
    Onboard(
      image: "assets/Illustration/Illustration-4.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_4.png",
      title: "Nearby stores",
      description:
          "Easily track nearby shops, browse through their items and get information about their products.",
    ),
  ];

  // Update the page index
  void updatePageIndex(int index) {
    pageIndex.value = index;
  }

  // Navigate to the next page or login screen
  void nextPage() {
    if (pageIndex.value < onboardingData.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Get.offNamed('/login'); // Adjust route to your login screen
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

class Onboard {
  final String image, title, description;
  final String? imageDarkTheme;

  Onboard({
    required this.image,
    required this.title,
    this.description = "",
    this.imageDarkTheme,
  });
}
