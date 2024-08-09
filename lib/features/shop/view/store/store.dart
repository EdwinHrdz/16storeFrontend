import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/common/widgets/appbar/appbar.dart';
import 'package:store16/common/widgets/custum_shapes/containers/search_container.dart';
import 'package:store16/common/widgets/layouts/lay_out.dart';
import 'package:store16/common/widgets/products/product_card/brand_card.dart';
import 'package:store16/common/widgets/textos/section_headind.dart';
import 'package:store16/features/shop/controller/store_controller.dart';
import 'package:store16/features/shop/view/store/widget/category_class.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(StoreController());

    return Scaffold(
      // Primer App Bar: Titulo
      appBar: TAppBar(title: Text('Store', style: Theme.of(context).textTheme.headlineMedium)),
      body: Obx(() {
        if (controller.categories.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return DefaultTabController(
            length: controller.categories.length,
            child: NestedScrollView(
              // Encabezado
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    expandedHeight: 440, // espacios entre Appbar y Appbar,
                    automaticallyImplyLeading: false,
                    backgroundColor: dark ? TColors.black : TColors.white,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // Barra de búsqueda
                          const SizedBox(height: TSizes.spaceBtwItems),
                          const TSearchContainer(
                            text: 'Busca en la tienda', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                          const SizedBox(height: TSizes.spaceBtwSections),
                          // - Marcas especiales
                          TSectionHeading(title: 'Mejores Marcas', onPressed: (){}),
                          const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                          // - Grid de las Marcas
                          TGridLayout(
                            itemCount: controller.brands.length, 
                            mainAxisExtent: 120,
                            itemBuilder: (_, index) {
                              final brand = controller.brands[index];
                              return TBrandCard(
                                showBorder: false,
                                image: brand.imageFileName,
                                title: brand.brandName,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    // Segundo Tab para navegación entre categorías
                    bottom: TabBar(
                      isScrollable: true,
                      indicatorColor: TColors.primary,
                      labelColor: dark ? TColors.white : TColors.primary,
                      unselectedLabelColor: TColors.darkerGrey,
                      tabs: controller.categories.map((category) => Tab(text: category.categoryName)).toList(),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: controller.categories.map((category) => TCategoryTab(categoryId: category.categoryID)).toList(),
              ),
            ),
          );
        }
      }),
    );
  }
}
