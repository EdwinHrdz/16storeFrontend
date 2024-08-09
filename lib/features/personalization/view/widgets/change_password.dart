import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/features/personalization/controller/change_password_controller.dart';

// ignore: use_key_in_widget_constructors
class ChangePasswordScreen extends StatelessWidget {
  final ChangePasswordController controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambio de Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: controller.changePasswordFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.newPasswordController,
                decoration: const InputDecoration(labelText: 'Nueva Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una nueva contraseña';
                  }
                  return null;
                },
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: controller.confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Confirmar Nueva Contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor confirme su nueva contraseña';
                  }
                  if (value != controller.newPasswordController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ElevatedButton(
                onPressed: () => controller.changePassword(),
                child: const Text('Cambiar Contraseña'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
