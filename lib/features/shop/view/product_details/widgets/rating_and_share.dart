import 'dart:math';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/features/shop/model/product.dart';

class TRatingAndShare extends StatelessWidget {
  final Product product;

  const TRatingAndShare({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Generar valores aleatorios para calificación y cantidad de reseñas
    final random = Random();
    final rating = (random.nextDouble() * 5).toStringAsFixed(1); // Valor de 0.0 a 5.0
    final reviewCount = random.nextInt(100); // Valor de 0 a 99

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating 
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '$rating ', style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: '($reviewCount)'),
                ],
              ),
            ),
          ],
        ),
        // Botón de compartir
        IconButton(
          onPressed: () {
            // Lógica para compartir
            final message = 'Check out this product: ${product.productName} for just \$${product.price}!';

            // Aquí puedes usar el paquete de compartir (share) para Flutter
            // Ejemplo:
            // Share.share(message);

            // ignore: avoid_print
            print('Shared: $message'); // Solo para depuración
          },
          icon: const Icon(Icons.share, size: TSizes.iconMd),
        ),
      ],
    );
  }
}
