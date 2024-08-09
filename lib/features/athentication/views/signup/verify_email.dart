import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/features/athentication/views/login/login.dart';
import 'package:store16/common/widgets/pantallas_custom/succes_email.dart';
import 'package:store16/utils/constants/image_strings.dart';
import 'package:store16/utils/constants/sizes.dart';
import 'package:store16/utils/constants/text_strings.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear),)
        ],
      ),
      body: SingleChildScrollView(
        // Padding para mandar el mismo espacion en todas las pantallas 
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Imagen 
              Image(image: const AssetImage(TImages.signInImage1), width: THelperFunctions.screenWidth() * 0.8),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Titulo y subtitulo 
              Text(TTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text('example@example.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwSections),
              // botones
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => SuccesEmailScreen(
                image: TImages.signInImage2,
                title: TTexts.yourAccountCreatedTitle,
                subTitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: () => Get.to(() => const LoginScreen()),
              ),), child: const Text(TTexts.tContinue))),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}