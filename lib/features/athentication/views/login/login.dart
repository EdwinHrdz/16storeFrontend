import 'package:flutter/material.dart';
import 'package:store16/common/styles/spacing_styles.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

import 'widgets/login_divider.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import 'widgets/login_social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarrHeight,
          child: Column(
            children: [
              // Logo, Titulo y Subtitulo
              TLoginHeader(dark: dark),

              // Fomulario para Inicio de Sesion
              const TLoginForm(),

            // Divider
            TLoginDivider(dark: dark),
            // Footer
            const SizedBox(height: TSizes.spaceBtwItems),
            const TLoginSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}