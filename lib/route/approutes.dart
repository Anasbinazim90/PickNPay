import 'package:get/get.dart';
import 'package:shop/entry_point.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/route/screen_export.dart';
import 'package:shop/screens/auth/views/forgot_password.dart';

class AppRoutes {
  static const String splash_screen = '/welcome_screen';
  static const String homescreen = '/homescreen';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotpasswordScreen = '/forgotpasswordScreen';
  static const String productDetail = '/productDetail';
  static const String entrypoint = '/entrypoint';
  static const String walletScreen = '/walletScreen';
  static const String kidsScreen = '/kidsScreen';
  static const String productreviewScreen = '/productreviewScreen';
  static const String orderScreen = '/orderScreen';
  static const String emptypaymentScreen = '/emptypaymentScreen';

  static List<GetPage> pages = [
// User View Routes
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: signup,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: onboarding,
      page: () => const OnBordingScreen(),
    ),
    GetPage(
      name: productDetail,
      page: () => const ProductDetailsScreen(),
    ),
    GetPage(
      name: entrypoint,
      page: () => const EntryPoint(),
    ),
    GetPage(
      name: walletScreen,
      page: () => const WalletScreen(),
    ),

    GetPage(
      name: kidsScreen,
      page: () => const KidsScreen(),
    ),
    GetPage(
      name: productreviewScreen,
      page: () => const ProductReviewsScreen(),
    ),

    GetPage(name: orderScreen, page: () => const OrdersScreen()),
    GetPage(name: forgotpasswordScreen, page: () => ForgotPasswordScreen()),
  ];
}
