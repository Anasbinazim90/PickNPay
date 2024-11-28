import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/models/ProductModel/product_model.dart';

class ApiService {
  final String baseUrl = "https://fakestoreapi.com/products";

  // Fetch all products
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => Product.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Error fetching products: $e");
    }
  }
}
