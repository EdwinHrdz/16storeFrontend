import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/common/widgets/appbar/appbar.dart';
import 'package:store16/common/widgets/custum_shapes/curved_edges/curved_edges_widget.dart';
import 'package:store16/common/widgets/icons/cicular_widget.dart';
//import 'package:store16/common/widgets/images/rounded_image.dart';
import 'package:store16/features/shop/model/product.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key, required this.product});
    final Product product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.dark : TColors.light,
        child: Stack(
          children: [
            // Imagen principal
            SizedBox(
              height: 400, 
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image.asset('assets/images/product/${product.imageURL}'),
                ),
              ),
            ),
            // Slider de Imagenes
            // Positioned(
            //   right: 0,
            //   bottom: 30,
            //   left: TSizes.defaultSpace,
            //   child: SizedBox(
            //     height: 80,
            //     child: ListView.separated(
            //       itemCount: product.imageURL.length, // Si tienes múltiples URLs de imágenes
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: const AlwaysScrollableScrollPhysics(),
            //       separatorBuilder: (_ , __) => const SizedBox(width: TSizes.spaceBtwItems,),
            //       itemBuilder: (_, index) => TRoundedImage(
            //         width: 80,
            //         border: Border.all(color: TColors.primary),
            //         backgroundColor: dark ? TColors.dark: TColors.light,
            //         padding: const EdgeInsets.all(TSizes.sm),
            //         imageUrl: 'assets/images/product/${product.imageURL[index]}',
            //       ),
            //     ),
            //   ),
            // ),
            // Iconos de AppBar
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}
