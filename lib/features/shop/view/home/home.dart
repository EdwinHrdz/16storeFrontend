import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/common/widgets/custum_shapes/containers/primary_header_container.dart';
import 'package:store16/common/widgets/custum_shapes/containers/search_container.dart';
import 'package:store16/common/widgets/products/product_card/product_card_vertcal.dart';
import 'package:store16/common/widgets/textos/section_headind.dart';
import 'package:store16/features/shop/controller/home_controller.dart';
import 'package:store16/features/shop/view/home/widgets/home_appbar.dart';
import 'package:store16/features/shop/view/home/widgets/home_categories.dart';
import 'package:store16/features/shop/view/home/widgets/promo_silder.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/image_strings.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  // Barra de búsqueda
                  TSearchContainer(text: 'Buscar en Tienda'),
                  SizedBox(height: TSizes.spaceBtwSections),
                  // Categorías
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
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
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            // Cuerpo del main
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
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
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Número de columnas en la cuadrícula
                          mainAxisSpacing: TSizes.gridViewSpacing + 2.0, // Espaciado vertical entre tarjetas
                          crossAxisSpacing: TSizes.gridViewSpacing + 2.0, // Espaciado horizontal entre tarjetas
                          childAspectRatio: 0.7, // Relación de aspecto para ajustar la altura de las tarjetas
                        ),
                        itemCount: controller.products.length,
                        itemBuilder: (_, index) {
                          return TProductCardVertical(product: controller.products[index]);
                        },
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
