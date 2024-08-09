import 'package:flutter/material.dart';
import 'package:store16/common/widgets/custum_shapes/containers/rounded_container.dart';
import 'package:store16/common/widgets/images/circular_image.dart';
import 'package:store16/common/widgets/textos/brand_text_with_verified_icon.dart';
import 'package:store16/common/widgets/textos/product_price_text.dart';
import 'package:store16/common/widgets/textos/product_title_text.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/helpers/helper_functions.dart';
import 'package:store16/features/shop/model/product.dart';

class TProductMetaData extends StatelessWidget {
  final Product product;

  const TProductMetaData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // - Precio
        Row(
          children: [
            // Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            // Precio anterior (tachado)
            Text(
              '\$${(product.price * 1.25).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodySmall!.apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            // Precio actual
            TProductPriceText(price: product.price.toString(), isLarge: true),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),
        // - Titulo 
        TProductTitleText(title: product.productName),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),
        // - Estado de inventario 
        Row(
          children: [
            const TProductTitleText(title: 'Status: '),
            Text(product.stock > 0 ? 'En Inventario' : 'Agotado', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: TSizes.spaceBtwItems / 1.5),
          ],
        ),
        // - Marca
        Row(
          children: [
            TCircularImage(
              image: 'assets/images/product/${product.imageURL}', // O el logo de la marca si está disponible
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(title: product.brand),
          ],
        ),
      ],
    );
  }
}
