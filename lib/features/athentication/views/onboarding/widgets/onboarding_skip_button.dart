
import 'package:flutter/material.dart';
import 'package:store16/features/athentication/controllers/onboarding_controller.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/device/device_utility.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(), 
      right: TSizes.defaultSpace, 
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPAge(), 
        child: const Text('skip'),
      )
    );
  }
}