
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/cart_controller/cart_controller.dart';
import 'package:shop/Controller/product_detail_controller/product_buy_now_controller.dart';
import 'package:shop/components/cart_button.dart';
import 'package:shop/components/custom_modal_bottom_sheet.dart';
import 'package:shop/components/network_image_with_loader.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/ProductModel/product_model.dart';
import 'package:shop/screens/product/views/added_to_cart_message_screen.dart';
import 'package:shop/screens/product/views/components/product_list_tile.dart';
import 'package:shop/screens/product/views/components/product_quantity.dart';
import 'package:shop/screens/product/views/components/selected_colors.dart';
import 'package:shop/screens/product/views/components/selected_size.dart';
import 'package:shop/screens/product/views/components/unit_price.dart';
import 'package:shop/screens/product/views/location_permission_store_availability_screen.dart';


class ProductBuyNowScreen extends StatelessWidget {
  final Product product;
  const ProductBuyNowScreen({super.key, required this.product, });

  @override
  Widget build(BuildContext context) {

    final CartController cartController = Get.put(CartController());    // GetX Controller for managing the state
    final ProductBuyNowController controller = Get.put(ProductBuyNowController());

    return Scaffold(
      bottomNavigationBar: CartButton(
        price: product.price,
        title: "Add to cart",
        subTitle: "Total price",
        press: () {

          cartController.addToCart(product);
          customModalBottomSheet(
            context,
            isDismissible: false,
            child: const AddedToCartMessageScreen(),
          );
        },
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 2,
              vertical: defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                const BackButton(),

                // Title Text
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w), // Add padding for better spacing
                    child: Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),

                // Bookmark Icon
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/icons/Bookmark.svg",
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: CustomScrollView(
              slivers: [
                 SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: AspectRatio(
                      aspectRatio: 1.05,
                      child: NetworkImageWithLoader(product.image, radius: defaultBorderRadious, fit: BoxFit.contain,),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(defaultPadding),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: UnitPrice(
                            priceAfterDiscount: product.price,  // Pass the priceAfterDiscount from the product
                          ),
                        ),
                        ProductQuantity(
                          numOfItem: controller.quantity.value,
                          onIncrement: controller.incrementQuantity,
                          onDecrement: controller.decrementQuantity,
                        ),
                      ],
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: Divider()),
                SliverToBoxAdapter(
                  child: SelectedColors(
                    colors: const [
                      Color(0xFFEA6262),
                      Color(0xFFB1CC63),
                      Color(0xFFFFBF5F),
                      Color(0xFF9FE1DD),
                      Color(0xFFC482DB),
                    ],
                    selectedColorIndex: 2,
                    press: (value) {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: SelectedSize(
                    sizes: const ["S", "M", "L", "XL", "XXL"],
                    selectedIndex: 1,
                    press: (value) {},
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  sliver: ProductListTile(
                    title: "Size guide",
                    svgSrc: "assets/icons/Sizeguid.svg",
                    isShowBottomBorder: true,
                    press: () {
                      // customModalBottomSheet(
                      //   context,
                      //   height: MediaQuery.of(context).size.height * 0.9,
                      //   child: const SizeGuideScreen(),
                      // );
                    },
                  ),
                ),
                SliverPadding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Store pickup availability",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        const Text(
                            "Select a size to check store availability and In-Store pickup options.")
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  sliver: ProductListTile(
                    title: "Check stores",
                    svgSrc: "assets/icons/Stores.svg",
                    isShowBottomBorder: true,
                    press: () {
                      customModalBottomSheet(
                        context,
                        height: MediaQuery.of(context).size.height * 0.92,
                        child: const LocationPermissonStoreAvailabilityScreen(),
                      );
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(height: defaultPadding))
              ],
            ),
          )
        ],
      ),
    );
  }
}