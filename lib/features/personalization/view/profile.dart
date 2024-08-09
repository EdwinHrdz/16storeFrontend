import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/common/widgets/appbar/appbar.dart';
import 'package:store16/common/widgets/images/circular_image.dart';
import 'package:store16/common/widgets/textos/section_headind.dart';
import 'package:store16/features/personalization/view/widgets/profile_menu_titles.dart';
import 'package:store16/utils/constants/image_strings.dart';
import 'package:store16/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Perfil de Usuario', ),
      ),
      // Boody
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Foto de perfil
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                     const TCircularImage(image: TImages.user1, width: 100, height: 100),
                    TextButton(onPressed: (){}, child: const Text('Cambiar foto de perfil')),
                  ],
                ),
              ),
              // Detalles
              const SizedBox(height: TSizes.spaceBtwItems / 2 ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Cabezera del Info 
              const TSectionHeading(title: 'Informacion del Perfil', showActionButton: false,), 
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Nombre:', value: 'Edwin Hernandez', icon: Iconsax.copy, onPressed: () {},),
              TProfileMenu(title: 'Nombre de Usuario:', value: 'E.Hernandez', icon: Iconsax.copy, onPressed: () {},),

              const SizedBox(height: TSizes.spaceBtwItems / 2 ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Informacion Personal
              const TSectionHeading(title: 'Informacion Personal', showActionButton: false,), 
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'ID de Usuario:', value: '007', onPressed: () {},),
              TProfileMenu(title: 'Correo:', value: 'Edwin.Hernandez@example.com', onPressed: () {},),
              TProfileMenu(title: 'Numero de Telefono:', value: '664-428-1725', onPressed: () {},),
              TProfileMenu(title: 'Genero:', value: 'Masculino', onPressed: () {},),
              TProfileMenu(title: 'Fecha de nacimiento:', value: '29 - Sep - 1194', onPressed: () {},),

              const SizedBox(height: TSizes.spaceBtwItems / 2 ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Boton de Eliminar Cuenta
              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Eliminar Cuenta', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

