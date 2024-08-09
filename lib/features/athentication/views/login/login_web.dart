import 'package:flutter/material.dart';
import 'package:store16/common/styles/spacing_styles.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

import 'widgets/login_divider.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import 'widgets/login_social_button.dart';

class LoginWebScreen extends StatelessWidget {
  const LoginWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarrHeight,
            child: Row(
              children: [
                // Imagen o Logo
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TLoginHeader(dark: dark),
                      const SizedBox(height: TSizes.spaceBtwItems),
                    ],
                  ),
                ),
                // Formulario de Login
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const TLoginForm(),
                        TLoginDivider(dark: dark),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TLoginSocialButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
