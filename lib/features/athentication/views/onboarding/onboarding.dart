import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/features/athentication/controllers/onboarding_controller.dart';

import 'package:store16/utils/constants/image_strings.dart';
import 'package:store16/utils/constants/text_strings.dart';

import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contoller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          // Paginas Scroleables Horizontales 
          PageView(
            controller: contoller.pageController,
            onPageChanged: contoller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: TImages.onBoardingImage1, 
                title: TTexts.onBordingTitle1, 
                subtitle: TTexts.onBordingSubTitle1,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage2, 
                title: TTexts.onBordingTitle2, 
                subtitle: TTexts.onBordingSubTitle2,
              ),
              OnboardingPage(
                image: TImages.onBoardingImage3, 
                title: TTexts.onBordingTitle3, 
                subtitle: TTexts.onBordingSubTitle3,
              ),
            ],
          ),
          // Boton de Skip
          const OnBoardingSkipButton(),
          // Dot Navigation 
          const OnBoardingDotNavigation(),
          // Boton Circular
          const OnBordingNextButton(),
        ],
      ),
    );
  }
}

