import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store16/features/athentication/views/login/login.dart';
import 'package:store16/features/athentication/views/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Funcion para mostrar la pantalla 
  screenRedirect() async {
    // Local Storage 
    deviceStorage.writeIfNull('isFirsttime', true);
    deviceStorage.read('isFirsttime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen()); 
  }
}