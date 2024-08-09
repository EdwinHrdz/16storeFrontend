import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/features/personalization/view/settings.dart';
import 'package:store16/features/shop/view/home/home_logic.dart';
import 'package:store16/features/shop/view/store/store.dart';
import 'package:store16/features/shop/view/wishlist/wishlist.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationContoller());
    final dark = THelperFunctions.isDarkMode(context);
    
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 65,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationContoller extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [ const HomeLogic() , const StoreScreen(), const WishListScreen(), const SettingsScreen()];
}