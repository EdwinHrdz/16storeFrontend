import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/features/athentication/controllers/login_controller.dart';
import 'package:store16/features/athentication/views/login/login.dart';
import 'package:store16/features/athentication/views/login/login_web.dart';

class LoginLoginc extends StatelessWidget {
  const LoginLoginc({super.key});

   @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Si el ancho es menor que 600px, mostrar la pantalla móvil
          return const LoginScreen();
        } else {
          // Si el ancho es mayor o igual a 600px, mostrar la pantalla web
          return const LoginWebScreen();
        }
      },
    );
  }
}