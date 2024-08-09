import 'package:flutter/material.dart';
import 'package:store16/common/widgets/custum_shapes/containers/rounded_container.dart';
import 'package:store16/common/widgets/images/circular_image.dart';
import 'package:store16/common/widgets/textos/brand_text_with_verified_icon.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/enums.dart';
import 'package:store16/utils/constants/sizes.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, 
    required this.showBorder,
    required this.image,
    required this.title,
    this.onTap,
  });

  final bool showBorder;
  final String image;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    
    return GestureDetector(
      onTap: onTap,
      // Diseño del contenedor
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // icon
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: 'assets/logos/$image',
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            // texto
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(title: title, brandTextSize: TextSizes.large),
                  const Text(
                    'Productos destacados.',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: TColors.darkerGrey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
