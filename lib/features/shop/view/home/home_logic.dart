import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/features/shop/controller/home_controller.dart';
import 'package:store16/features/shop/view/home/home.dart';
import 'package:store16/features/shop/view/home/home_screen_web.dart';

class HomeLogic extends StatelessWidget {
  const HomeLogic({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(HomeController());

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const HomeScreen();
        } else {
          return const HomeScreenWeb();
        }
      },
    );
  }
}
