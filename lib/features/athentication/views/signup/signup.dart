import 'package:flutter/material.dart';
import 'package:store16/features/athentication/views/login/widgets/login_divider.dart';
import 'package:store16/features/athentication/views/login/widgets/login_social_button.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/constants/text_strings.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            // Title 
              Text(TTexts.singUpTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.left),
              const SizedBox(height: TSizes.spaceBtwSections),
            // Form
            TSignupForm(dark: dark),
            // Divider
            const SizedBox(height: TSizes.spaceBtwSections),
            TLoginDivider(dark: dark),
            // Redes Sociales
            const SizedBox(height: TSizes.spaceBtwItems),
            const TLoginSocialButton(),
          ],),
        ),
      ),
    );
  }
}

