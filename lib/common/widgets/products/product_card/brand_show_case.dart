import 'package:flutter/material.dart';
import 'package:store16/common/widgets/custum_shapes/containers/rounded_container.dart';
import 'package:store16/common/widgets/products/product_card/brand_card.dart';
import 'package:store16/features/shop/model/brand.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, required this.brand,
  });

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          // Titulo de marca con la cuenta de items
          TBrandCard(
            showBorder: false,
            image: brand.imageFileName,
            title: brand.brandName,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  final dark = THelperFunctions.isDarkMode(context);

  return Expanded(
    child: TRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(right: TSizes.sm),
      backgroundColor: dark ? TColors.darkerGrey : TColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
