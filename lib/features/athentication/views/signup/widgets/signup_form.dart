import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/features/athentication/controllers/signup_controller.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/constants/text_strings.dart';
import 'package:store16/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // Fila para Nombre y apellido
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.name,
                  validator: (value) => TValidator.validateEmpyText(TTexts.firstName, value),
                  decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validateEmpyText(TTexts.lastName, value),
                  decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Username
          TextFormField(
            controller: controller.userName,
            validator: (value) => TValidator.validateEmpyText(TTexts.userName, value),
            decoration: const InputDecoration(labelText: TTexts.userName, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Teléfono
          TextFormField(
            controller: controller.phoneNo,
            validator: (value) => TValidator.validateEmpyText(TTexts.phoneNo, value),
            decoration: const InputDecoration(labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Contraseña
          TextFormField(
            controller: controller.password,
            validator: (value) => TValidator.validatePassword(value),
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Términos y condiciones checkbox
          Row(
            children: [
              SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value) {})),
              const SizedBox(width: TSizes.spaceBtwItems),
              Flexible(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                        text: '${TTexts.privacyPolicy} ',
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: dark ? TColors.white : TColors.primary,
                            ),
                      ),
                      TextSpan(text: '${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(
                        text: '${TTexts.termsOfUse} ',
                        style: Theme.of(context).textTheme.bodySmall!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor: dark ? TColors.white : TColors.primary,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Botón de registrarse
          const SizedBox(height: TSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
