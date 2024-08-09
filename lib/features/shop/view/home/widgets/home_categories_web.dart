import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/features/shop/controller/home_controller.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';

class THomeCategoriesWeb extends StatelessWidget {
  const THomeCategoriesWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      if (controller.categories.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.categories.length,
          itemBuilder: (_, index) {
            final category = controller.categories[index];
            return GestureDetector(
              onTap: () {
                // Acción al hacer clic en una categoría (por ejemplo, filtrar productos por categoría)
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/categories/${category.imageFileName}',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: TSizes.defaultSpace),
                    Text(
                      category.categoryName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: TColors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
