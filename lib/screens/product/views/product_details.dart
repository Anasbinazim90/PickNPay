import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/product_detail_controller/product_image_controller.dart';
import 'package:shop/components/cart_button.dart';
import 'package:shop/components/custom_modal_bottom_sheet.dart';
import 'package:shop/components/review_card.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/ProductModel/product_model.dart';
import 'package:shop/components/network_image_with_loader.dart';
import 'package:shop/screens/product/views/components/notify_me_card.dart';
import 'package:shop/screens/product/views/components/product_info.dart';
import 'package:shop/screens/product/views/components/product_list_tile.dart';
import 'package:shop/screens/product/views/product_buy_now_screen.dart';
import 'package:shop/screens/product/views/product_returns_screen.dart';

class ProductDescription extends StatelessWidget {
  final Product product;

  const ProductDescription({
    super.key,
    required this.product,
    this.isProductAvailable = true,
  });
  final bool isProductAvailable;

  // Create a list containing the product image

  @override
  Widget build(BuildContext context) {
    final ProductImagesController controller =
        Get.put(ProductImagesController());
    final List<String> images = [product.image];
    return Scaffold(
      bottomNavigationBar: isProductAvailable
          ? CartButton(
        price: product.price,
        title: "Buy Now",
        subTitle: "Total price",
        press: () {
          // Push the ProductBuyNowScreen and pass the product
          customModalBottomSheet(
            context,
            height: MediaQuery.of(context).size.height * 0.92,
            child: ProductBuyNowScreen(product: product),  // Passing the product to the next screen
          );
        },
      )

          :

          /// If profuct is not available then show [NotifyMeCard]
          NotifyMeCard(
              isNotify: false,
              onChanged: (value) {},
            ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          floating: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/Bookmark.svg",
                  color: Theme.of(context).textTheme.bodyLarge!.color),
            ),
          ],
        ),

        ///Product image page view builder
        SliverToBoxAdapter(
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                // PageView to display the images
                PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: images.length, // Use the length of the list
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(defaultBorderRadious * 2),
                      ),
                      child: NetworkImageWithLoader(
                          images[index], fit: BoxFit.contain,), // Use the image URL
                    ),
                  ),
                ),
                // Dots indicator for the image count
                Positioned(
                  height: 20,
                  bottom: 24,
                  right: MediaQuery.of(context).size.width * 0.15,
                  child: Obx(() {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Row(
                        children: List.generate(
                          images.length, // Dynamically set the length
                          (index) => Padding(
                            padding: EdgeInsets.only(
                              right: index == (images.length - 1)
                                  ? 0
                                  : defaultPadding / 4,
                            ),
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .color!
                                  .withOpacity(
                                    index == controller.currentPage.value
                                        ? 1
                                        : 0.2,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),

        ///Product image page view builder

        /// Product information
        ProductInfo(
          brand: product.category,
          title: product.title,
          isAvailable: isProductAvailable,
          description: product.description,
          rating: product.rating.rate,
          numOfReviews: product.rating.count,
        ),

        /// Product information

        /// List tiles
        ProductListTile(
          svgSrc: "assets/icons/Product.svg",
          title: "Product Details",
          press: () {},
        ),
        ProductListTile(
          svgSrc: "assets/icons/Delivery.svg",
          title: "Shipping Information",
          press: () {},
        ),
        ProductListTile(
          svgSrc: "assets/icons/Return.svg",
          title: "Returns",
          isShowBottomBorder: true,
          press: () {
            customModalBottomSheet(
              context,
              height: MediaQuery.of(context).size.height * 0.92,
              child: const ProductReturnsScreen(),
            );
          },
        ),
        /// List tiles
        ///
        /// Reviwe Card
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: ReviewCard(
              rating: product.rating.rate,
              numOfReviews: product.rating.count,
              numOfFiveStar: 80,
              numOfFourStar: 30,
              numOfThreeStar: 5,
              numOfTwoStar: 4,
              numOfOneStar: 1,
            ),
          ),
        ),
        /// Reviwe Card
      ]),
    );
  }
}
