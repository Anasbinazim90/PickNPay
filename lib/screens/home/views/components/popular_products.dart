// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shop/components/product/product_card.dart';
// import 'package:shop/constants.dart';
// import 'package:shop/screens/product/views/product_details.dart';
// import 'package:shop/services/ApiServices/api_services.dart';
// import 'package:shop/models/ProductModel/product_model.dart';
// class PopularProducts extends StatelessWidget {
//   final ApiService apiServices = ApiService();
//
//   PopularProducts({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Product>?>( // Assuming the correct model
//       future: apiServices.fetchProducts(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text(
//               'Error: ${snapshot.error}',
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: Colors.red),
//             ),
//           );
//         } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No products available'));
//         }
//
//         return Padding(
//           padding: const EdgeInsets.all(10),
//           child: GridView.builder(
//             shrinkWrap: true,  // Prevents GridView from taking unbounded height
//             physics: NeverScrollableScrollPhysics(),  // Disables scrolling to avoid conflicts with parent scroll
//             gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 0.7,
//               mainAxisSpacing: defaultPadding,
//               crossAxisSpacing: defaultPadding,
//             ),
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final product = snapshot.data![index];
//               return ProductCard(
//                 product: product,
//                 press: () {
// //                   Get.to(() => ProductDescription(product: product));
// //                   print('Pressed on ${product.title}');
// //                 },
// //               );
// //             },
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/product_category_controller/product_category_controller.dart';
import 'package:shop/components/product/product_card.dart';
import 'package:shop/constants.dart';
import 'package:shop/screens/product/views/product_details.dart';

class PopularProducts extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.filteredProducts.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          shrinkWrap: true, // Prevents GridView from taking unbounded height
          physics: const NeverScrollableScrollPhysics(), // Disables scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: defaultPadding,
            crossAxisSpacing: defaultPadding,
          ),
          itemCount: controller.filteredProducts.length,
          itemBuilder: (context, index) {
            final product = controller.filteredProducts[index];
            return ProductCard(
                              product: product,
                press: () {
                  Get.to(() => ProductDescription(product: product));
                  print('Pressed on ${product.title}');
                },
              );


          },
        ),
      );
    });
  }
}
