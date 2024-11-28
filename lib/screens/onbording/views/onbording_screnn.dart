import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop/Controller/onboarding_controller/Onboarding_Controller.dart';
import 'package:shop/components/dot_indicators.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/approutes.dart';
import 'package:shop/screens/onbording/views/components/onbording_content.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final onboardingController = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.login);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: onboardingController.pageController,
                  itemCount: onboardingController.onboardingData.length,
                  onPageChanged: onboardingController.updatePageIndex,
                  itemBuilder: (context, index) {
                    final onboard = onboardingController.onboardingData[index];
                    return OnboardingContent(
                      title: onboard.title,
                      description: onboard.description,
                      image: (Theme.of(context).brightness == Brightness.dark &&
                              onboard.imageDarkTheme != null)
                          ? onboard.imageDarkTheme!
                          : onboard.image,
                      isTextOnTop: index.isOdd,
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Obx(
                    () => Row(
                      children: List.generate(
                        onboardingController.onboardingData.length,
                        (index) => Padding(
                          padding:
                              const EdgeInsets.only(right: defaultPadding / 4),
                          child: DotIndicator(
                            isActive:
                                index == onboardingController.pageIndex.value,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: onboardingController.nextPage,
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Arrow - Right.svg",
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
