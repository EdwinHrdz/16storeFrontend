import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/common/widgets/custum_shapes/containers/search_container.dart';
import 'package:store16/common/widgets/products/product_card/product_card_vertcal.dart';
import 'package:store16/common/widgets/textos/section_headind.dart';
import 'package:store16/features/shop/controller/home_controller.dart';
import 'package:store16/features/shop/view/home/widgets/promo_silder.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/image_strings.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/constants/text_strings.dart';

import 'widgets/home_categories_web.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: Row(
        children: [
          // Barra de navegación lateral para las categorías
          Container(
            width: 250,
            color: TColors.primary,
            child: const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Cabecera de Categorías
                  TSectionHeading(
                    title: TTexts.popularCategories,
                    showActionButton: false,
                    textColor: TColors.white,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  // Diseño de Categorías
                  Expanded(child: THomeCategoriesWeb()),
                ],
              ),
            ),
          ),
          // Contenido principal
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    // Barra de búsqueda
                    const TSearchContainer(text: 'Buscar en Tienda'),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    // Promo Slider de arriba
                    const TPromoSlider(
                      banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    // Artículos populares
                    TSectionHeading(
                      title: 'Productos Populares',
                      showActionButton: false,
                      onPressed: () {},
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Obx(() {
                      if (controller.products.isEmpty) {
                        return const CircularProgressIndicator();
                      } else {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300, // Tamaño máximo de cada tarjeta
                            mainAxisSpacing: TSizes.gridViewSpacing,
                            crossAxisSpacing: TSizes.gridViewSpacing,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: controller.products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) => TProductCardVertical(product: controller.products[index]),
                        );
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
