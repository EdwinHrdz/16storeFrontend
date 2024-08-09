import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/common/widgets/appbar/appbar.dart';
import 'package:store16/common/widgets/icons/cicular_widget.dart';
import 'package:store16/common/widgets/layouts/lay_out.dart';
import 'package:store16/common/widgets/products/product_card/product_card_vertcal.dart';
import 'package:store16/features/shop/controller/home_controller.dart';
import 'package:store16/features/shop/view/home/home.dart';
import 'package:store16/utils/constants/sizes.dart';
//import 'package:store16/utils/helpers/helper_functions.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(HomeController());
    //final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text('WishList',
        style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()) ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TGridLayout(itemCount: 6, itemBuilder: ( _ , index ) => TProductCardVertical(product: controller.products[index]))
          ],
        ),
      ),
    );
  }
}