import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:store16/features/shop/controller/home_controller.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      if (controller.categories.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = controller.categories[index];
              return TVerticalImageText(
                image: 'assets/images/categories/${category.imageFileName}',
                title: category.categoryName,
                onTap: () {},
              );
            },
          ),
        );
      }
    });
  }
}
