import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/common/widgets/layouts/lay_out.dart';
import 'package:store16/common/widgets/products/product_card/product_card_vertcal.dart';
import 'package:store16/common/widgets/textos/section_headind.dart';
import 'package:store16/features/shop/controller/store_controller.dart';
import 'package:store16/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  final int categoryId;

  const TCategoryTab({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StoreController>();
    
    controller.fetchProductsByCategory(categoryId);

    return Obx(() {
      if (controller.productsByCategory[categoryId] == null) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [ 
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // productos
                  TSectionHeading(title: 'Productos', onPressed: (){}),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                    itemCount: controller.productsByCategory[categoryId]!.length,
                    itemBuilder: (_, index) => TProductCardVertical(product: controller.productsByCategory[categoryId]![index]),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    });
  }
}
