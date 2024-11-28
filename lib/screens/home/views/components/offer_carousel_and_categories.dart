import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/product_category_controller/product_category_controller.dart';
import 'package:shop/constants.dart';

import 'categories.dart';
import 'offers_carousel.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  OffersCarouselAndCategories({super.key});

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OffersCarousel(),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Categories(),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Obx(() {
            String popularProductsText = "Popular Products";
            if (controller.selectedCategory.value == "Man's") {
              popularProductsText = "Men's Clothing";
            } else if (controller.selectedCategory.value == "Woman’s") {
              popularProductsText = "Women's Clothing";
            }
            return Text(
              popularProductsText,
              style: Theme.of(context).textTheme.titleSmall,
            );
          }),
        ),
      ],
    );
  }
}
