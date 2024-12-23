import 'package:get/get.dart';
import 'package:shop/models/ProductModel/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  double get totalPrice => cartItems.fold(0.0, (sum, item) => sum + item.price);
}
