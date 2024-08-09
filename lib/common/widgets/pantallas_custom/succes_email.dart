import 'package:flutter/material.dart';
import 'package:store16/common/styles/spacing_styles.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/constants/text_strings.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class SuccesEmailScreen extends StatelessWidget {
  const SuccesEmailScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarrHeight * 2,
          child: Column(
            children: [
              // Imagen 
              Image(image: AssetImage(image), width: THelperFunctions.screenWidth() * 0.8),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Titulo y subtitulo 
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(subTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              // botones
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(TTexts.tContinue))),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}