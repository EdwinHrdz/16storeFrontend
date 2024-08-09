import 'package:flutter/material.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/image_strings.dart';
import 'package:store16/utils/constants/sizes.dart';

class TLoginSocialButton extends StatelessWidget {
  const TLoginSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100), color: TColors.white),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.facebook),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100), color: TColors.white),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImages.cesun),
            ),
          ),
        ),
      ],
    );
  }
}