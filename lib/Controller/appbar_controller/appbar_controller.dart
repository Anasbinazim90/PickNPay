import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollControllerGetx extends GetxController {
  late ScrollController scrollController; // ScrollController instance
  var scrollOffset = 0.0.obs; // Reactive scroll offset

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    scrollOffset.value = scrollController.offset;
  }

  @override
  void onClose() {
    scrollController.dispose(); // Dispose of the controller
    super.onClose();
  }
}
