import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/features/athentication/controllers/login_controller.dart';
import 'package:store16/features/athentication/views/signup/signup.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/constants/text_strings.dart';
import 'package:store16/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: controller.emailController,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email),
            onChanged: controller.setEmail,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Password
          TextFormField(
            controller: controller.passwordController,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.lock),
              labelText: TTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            onChanged: controller.setPassword,
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),
          // Remember Me and Forget Pass
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(TTexts.rememberMe),
                ],
              ),
              // Forget pass
              TextButton(onPressed: () {}, child: const Text(TTexts.forgetPassword)),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          // Sign in Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.login(),
              child: const Text(TTexts.singIn),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          // Create Account
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(() => const SignupScreen()),
              child: const Text(TTexts.createAccount),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
        ],
      ),
    );
  }
}
