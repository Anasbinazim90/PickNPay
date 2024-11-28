import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/screens/home/views/components/popular_products.dart';


class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          PopularProducts(),
        ],
      )),

    );
  }
}
