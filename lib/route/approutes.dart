import 'package:get/get.dart';
import 'package:shop/entry_point.dart';
import 'package:shop/route/screen_export.dart';
import 'package:shop/screens/auth/views/forgot_password.dart';
import 'package:shop/screens/checkout/views/register.dart';
import 'package:shop/screens/profile/views/components/profile_info.dart';
import 'package:shop/screens/splash/SplashScreen.dart';

class AppRoutes {
  static const String splash_screen = '/splashscreen';
  static const String homescreen = '/homescreen';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotpasswordScreen = '/forgotpasswordScreen';
  static const String productDetail = '/productDetail';
  static const String entrypoint = '/entrypoint';
  static const String walletScreen = '/walletScreen';
  static const String cartScreen = '/cartScreen';
  static const String registerScreen = '/registerScreen';
  static const String profileInfo = '/profileInfo';
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
      name: splash_screen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: signup,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: onboarding,
      page: () =>  OnboardingScreen(),
    ),
    GetPage(
      name: cartScreen,
      page: () =>  CartScreen(),
    ),
    GetPage(
      name: registerScreen,
      page: () =>  RegisterScreen(),
    ),
    GetPage(
      name: entrypoint,
      page: () =>  EntryPoint(),
    ),
    GetPage(
      name: walletScreen,
      page: () => const WalletScreen(),
    ),
    GetPage(
      name: profileInfo,
      page: () =>  ProfileInfo(),
    ),
    GetPage(
      name: productreviewScreen,
      page: () => const ProductReviewsScreen(),
    ),

    GetPage(name: forgotpasswordScreen, page: () => ForgotPasswordScreen()),
  ];
}
