import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store16/features/athentication/views/login/login_logic.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // variables 
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Actualizar la Pagina Actual
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Brincar a un punto espesifico
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Actualizar el indice actual y brincar a la siguiente pagina 
  void nextPage() {
    if (currentPageIndex.value == 2 ){
      final storage = GetStorage();
      storage.write('isFirsttime', false);
      Get.offAll(() => const LoginLoginc());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Actualizar el indice actual y brincar a la ultima pagina
  void skipPAge() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}