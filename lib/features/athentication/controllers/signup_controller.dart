// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:store16/common/widgets/pantallas_custom/succes_email.dart';
import 'package:store16/features/athentication/views/login/login_logic.dart';
import 'package:store16/utils/constants/image_strings.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final name = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // SignUp
  Future<void> signup() async {
    if (!signupFormKey.currentState!.validate()) {
      return;
    }

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.snackbar('Error', 'No hay conexión a Internet');
      return;
    }

    const registerUrl = 'http://localhost:45103/Access/register'; 

    try {
      final body = jsonEncode(<String, String>{
        'name': name.text,
        'lastName': lastName.text,
        'userName': userName.text,
        'email': email.text,
        'phoneNo': phoneNo.text,
        'password': password.text,
      });

      //print("Request Body: $body"); // Log the request body

      final registerResponse = await http.post(
        Uri.parse(registerUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      //print("Response Body: ${registerResponse.body}"); // Log the response body

      if (registerResponse.statusCode == 200) {
        final jsonResponse = jsonDecode(registerResponse.body);
        if (jsonResponse['isSuccess'] == 1) {
          Get.to(() => SuccesEmailScreen(
            image: TImages.signInImage1, 
            title: "Tu cuenta se creó con éxito!", 
            subTitle: "Ahora inicia sesion con tu nueva cuenta", 
            onPressed: () => Get.to(() => const LoginLoginc()) ,));
        } else {
          Get.snackbar('Error', jsonResponse['message']);
        }
      } else {
        Get.snackbar('Error', 'Error al registrar el usuario: ${registerResponse.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Ocurrió un error: $e');
    }
  }
}
