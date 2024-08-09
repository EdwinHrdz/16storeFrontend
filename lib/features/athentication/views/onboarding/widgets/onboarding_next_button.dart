import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/features/athentication/controllers/onboarding_controller.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/device/device_utility.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class OnBordingNextButton extends StatelessWidget {
  const OnBordingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnboardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark? TColors.primary : TColors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}