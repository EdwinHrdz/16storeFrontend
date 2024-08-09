import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangePasswordController extends GetxController {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  Future<void> changePassword() async {
    if (!changePasswordFormKey.currentState!.validate()) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';

    const changePasswordUrl = 'http://localhost:45103/Access/changePassword';

    try {
      final body = jsonEncode(<String, String>{
        'newPassword': newPasswordController.text,
        'confirmPassword': confirmPasswordController.text,
        'token': token,  // Incluir el token en el cuerpo de la solicitud
      });

      final headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };

      // Print the headers and body
      print('Headers: $headers');
      print('Body: $body');

      final response = await http.post(
        Uri.parse(changePasswordUrl),
        headers: headers,
        body: body,
      );

      // Print the response
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Get.snackbar('Éxito', 'Contraseña cambiada exitosamente');
      } else {
        Get.snackbar('Error', 'Error al cambiar la contraseña: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Ocurrió un error: $e');
    }
  }

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
