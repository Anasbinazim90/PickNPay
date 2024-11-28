import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductImagesController extends GetxController {
  late PageController pageController;
  var currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController(viewportFraction: 0.9);
    super.onInit();
  }

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
