// import 'package:flutter/material.dart';
// import 'package:shop/constants.dart';
// import '/components/network_image_with_loader.dart';
//
//
// class ProductImages extends StatefulWidget {
//   const ProductImages({
//     super.key,
//
//     required this.images,
//   });
//
//   final List<String> images;
//
//   @override
//   State<ProductImages> createState() => _ProductImagesState();
// }
//
// class _ProductImagesState extends State<ProductImages> {
//   late PageController _controller;
//
//   int _currentPage = 0;
//
//   @override
//   void initState() {
//     _controller =
//         PageController(viewportFraction: 0.9, initialPage: _currentPage);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: AspectRatio(
//         aspectRatio: 1,
//         child: Stack(
//           children: [
//             PageView.builder(
//               controller: _controller,
//               onPageChanged: (pageNum) {
//                 setState(() {
//                   _currentPage = pageNum;
//                 });
//               },
//               itemCount: widget.images.length,
//               itemBuilder: (context, index) => Padding(
//                 padding: const EdgeInsets.only(right: defaultPadding),
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(defaultBorderRadious * 2),
//                   ),
//                   child: NetworkImageWithLoader(widget.images[index]),
//                 ),
//               ),
//             ),
//             if (widget.images.length > 1)
//               Positioned(
//                 height: 20,
//                 bottom: 24,
//                 right: MediaQuery.of(context).size.width * 0.15,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: defaultPadding * 0.75,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).scaffoldBackgroundColor,
//                     borderRadius: const BorderRadius.all(Radius.circular(50)),
//                   ),
//                   child: Row(
//                     children: List.generate(
//                       widget.images.length,
//                       (index) => Padding(
//                         padding: EdgeInsets.only(
//                             right: index == (widget.images.length - 1)
//                                 ? 0
//                                 : defaultPadding / 4),
//                         child: CircleAvatar(
//                           radius: 3,
//                           backgroundColor: Theme.of(context)
//                               .textTheme
//                               .bodyLarge!
//                               .color!
//                               .withOpacity(index == _currentPage ? 1 : 0.2),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/product_detail_controller/product_image_controller.dart';
import 'package:shop/constants.dart';
import 'package:shop/models/ProductModel/product_model.dart';
import '/components/network_image_with_loader.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
    required this.product,
  });

  final Product product; // Accept the full Product object

  @override
  Widget build(BuildContext context) {
    final ProductImagesController controller = Get.put(ProductImagesController());

    // Create a list containing the product image
    final List<String> images = [product.image]; // Single image added to the list

    return SliverToBoxAdapter(
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
                  child: NetworkImageWithLoader(images[index]), // Use the image URL
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
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                            index == controller.currentPage.value ? 1 : 0.2,
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
    );
  }
}
