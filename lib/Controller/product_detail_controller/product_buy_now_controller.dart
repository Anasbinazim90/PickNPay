import 'package:get/get.dart';

class ProductBuyNowController extends GetxController {
  // Manage quantity state
  var quantity = 1.obs; // .obs makes it an observable

  // Increment the quantity
  void incrementQuantity() {
    quantity++;
  }

  // Decrement the quantity
  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}