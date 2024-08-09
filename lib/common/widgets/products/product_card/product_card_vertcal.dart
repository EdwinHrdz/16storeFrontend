import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/common/styles/shadow.dart';
import 'package:store16/common/widgets/custum_shapes/containers/rounded_container.dart';
import 'package:store16/common/widgets/icons/cicular_widget.dart';
import 'package:store16/common/widgets/images/rounded_image.dart';
import 'package:store16/common/widgets/textos/brand_text_with_verified_icon.dart';
import 'package:store16/common/widgets/textos/product_price_text.dart';
import 'package:store16/common/widgets/textos/product_title_text.dart';
import 'package:store16/features/shop/model/product.dart';
import 'package:store16/features/shop/view/product_details/product_details.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  final Product product;

  const TProductCardVertical({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap:  () => Get.to(() => ProductDetail(productId: product.productID)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail , Wishlist button, dinscount tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.darkerGrey : TColors.light,
              child: Stack(
                children: [
                  // Thumbnail image 
                  TRoundedImage(imageUrl: 'assets/images/product/${product.imageURL}', aplyImageRadius: true),
      
                  // Sale Tag 
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%' , style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),
      
                  // Icono de Favortio
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  )
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            // details 
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.productName, smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: product.brand),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price 
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(price: product.price.toString(), isLarge: true),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    )
                  ),
                  child: const SizedBox(
                    width: TSizes.iconLg * 1.2,
                    height: TSizes.iconLg * 1.2,
                    child: Center(child: Icon(Iconsax.add, color: TColors.white,))
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
