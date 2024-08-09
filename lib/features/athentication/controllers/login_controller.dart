import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store16/features/shop/model/user.dart';
import 'package:store16/navigation_menu.dart'; // Importa la clase User

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var user = User(
    userId: 0,
    name: '',
    lastName: '',
    userName: '',
    email: '',
    phoneNo: '',
    userType: 0,
    token: '',
    isSuccess: 0,
    message: '',
  ).obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    emailController.text = email.value;
    passwordController.text = password.value;
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    const loginUrl = 'http://localhost:45103/Access/login';

    try {
      final body = jsonEncode(<String, String>{
        'email': email.value,
        'password': password.value,
      });

      final loginResponse = await http.post(
        Uri.parse(loginUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      if (loginResponse.statusCode == 200) {
        final jsonResponse = jsonDecode(loginResponse.body);

        if (jsonResponse['isSuccess'] == 1) {
          user.value = User.fromJson(jsonResponse);
          // Guardar tocken en almacenamiento local
          await saveToken(jsonResponse['token']);
          // Navegar a la pantalla principal en caso de éxito
          Get.offAll(() => const NavigationMenu());
        } else {
          Get.snackbar('Error', jsonResponse['message']);
        }
      } else {
        Get.snackbar('Error', 'Error al iniciar sesión: ${loginResponse.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Ocurrió un error: $e');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
}
}
