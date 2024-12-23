import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/screen_export.dart';
import 'package:shop/screens/appbar/appbar.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List _pages = [
    const HomeScreen(),
    const DiscoverScreen(),
    const BookmarkScreen(),
    const ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
            color ??
                Theme.of(context).iconTheme.color!.withOpacity(
                    Theme.of(context).brightness == Brightness.dark ? 0.3 : 1),
            BlendMode.srcIn),
      );
    }

    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(100), child: AppbarScreen()),
      // appBar: AppBar(
      //   // pinned: true,
      //   // floating: true,
      //   // snap: true,
      //   scrolledUnderElevation: 0,
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   leading: const SizedBox(),
      //   leadingWidth: 0,
      //   centerTitle: false,
      //   title: SvgPicture.asset(
      //     "assets/logo/picknpay.svg",
      //     colorFilter: ColorFilter.mode(
      //         Theme.of(context).iconTheme.color!, BlendMode.srcIn),
      //     height: 30,
      //     width: 100,
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         // Navigator.pushNamed(context, searchScreenRoute);
      //       },
      //       icon: SvgPicture.asset(
      //         "assets/icons/Search.svg",
      //         height: 24,
      //         colorFilter: ColorFilter.mode(
      //             Theme.of(context).textTheme.bodyLarge!.color!,
      //             BlendMode.srcIn),
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         Get.toNamed(AppRoutes.cartScreen);
      //       },
      //       icon: SvgPicture.asset(
      //         "assets/icons/Bag.svg",
      //         height: 24,
      //         colorFilter: ColorFilter.mode(
      //             Theme.of(context).textTheme.bodyLarge!.color!,
      //             BlendMode.srcIn),
      //       ),
      //     ),
      //   ],
      // ),
      // body: _pages[_currentIndex],
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          // selectedLabelStyle: TextStyle(color: primaryColor),
          selectedFontSize: 12,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Shop.svg"),
              activeIcon: svgIcon("assets/icons/Shop.svg", color: primaryColor),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Category.svg"),
              activeIcon:
                  svgIcon("assets/icons/Category.svg", color: primaryColor),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Bookmark.svg"),
              activeIcon:
                  svgIcon("assets/icons/Bookmark.svg", color: primaryColor),
              label: "Bookmark",
            ),

            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Profile.svg"),
              activeIcon:
                  svgIcon("assets/icons/Profile.svg", color: primaryColor),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
