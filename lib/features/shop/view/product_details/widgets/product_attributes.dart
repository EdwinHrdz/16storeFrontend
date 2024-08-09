import 'package:flutter/material.dart';
import 'package:store16/common/widgets/custum_shapes/containers/rounded_container.dart';
import 'package:store16/common/widgets/textos/product_price_text.dart';
import 'package:store16/common/widgets/textos/product_title_text.dart';
import 'package:store16/common/widgets/textos/section_headind.dart';
import 'package:store16/features/shop/view/product_details/widgets/choice_chip.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/helpers/helper_functions.dart';
import 'package:store16/features/shop/model/product.dart';

class TProductAttributes extends StatelessWidget {
  final Product product;

  const TProductAttributes({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // - Atributo seleccionado con precio y descripción
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // Titulo y precio y Stock de la variación
              Row(
                children: [
                  const TSectionHeading(title: 'Variación', showActionButton: false),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Precio:    ', smallSize: true),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          // Precio anterior
                          Text(
                            '\$${(product.price * 1.25).toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                          ),
                          // Precio de venta
                          TProductPriceText(price: product.price.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(title: 'Inventario:  ', smallSize: true),
                          Text(
                            product.stock > 0 ? 'En Inventario' : 'Agotado',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // Descripción de la variación
              const SizedBox(height: TSizes.spaceBtwItems),
              TProductTitleText(
                title: product.description,
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        // - Atributos
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // - - Propiedad de color
            const TSectionHeading(title: 'Color', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              children: [
                TChoiceChip(text: 'Green', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'Red', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'Purple', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // - - Propiedad de tamaño
            const TSectionHeading(title: 'Tamaño', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              children: [
                TChoiceChip(text: 'S', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'M', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'L', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
