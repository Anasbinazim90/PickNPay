import 'package:get/get.dart';
import 'package:shop/models/ProductModel/product_model.dart';
import 'package:shop/services/ApiServices/api_services.dart';

class ProductController extends GetxController {
  final ApiService apiServices = ApiService();

  var allProducts = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var selectedCategory = "All Categories".obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      final products = await apiServices.fetchProducts();
      allProducts.assignAll(products);
      filterProducts(); // Initial filter (all products)
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  void filterProducts() {
    if (selectedCategory.value == "All Categories") {
      filteredProducts.assignAll(allProducts);
    } else if (selectedCategory.value == "Man's") {
      filteredProducts.assignAll(
        allProducts.where((product) => product.category == "men's clothing"),
      );
    } else if (selectedCategory.value == "Woman’s") {
      filteredProducts.assignAll(
        allProducts.where((product) => product.category == "women's clothing"),
      );
    }
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
    filterProducts();
  }
}
