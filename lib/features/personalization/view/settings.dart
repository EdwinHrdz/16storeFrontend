import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/common/widgets/appbar/appbar.dart';
import 'package:store16/common/widgets/custum_shapes/containers/primary_header_container.dart';
import 'package:store16/common/widgets/textos/section_headind.dart';
import 'package:store16/features/personalization/view/profile.dart';
import 'package:store16/features/personalization/view/widgets/change_password.dart';
import 'package:store16/features/personalization/view/widgets/setings_menu_title.dart';
import 'package:store16/features/personalization/view/widgets/user_profile_title.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Configuraciones', 
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                      ),
                    ),
                    // User Profile
                    TUserProfileTitle(onPressed: () => Get.to(() => const ProfileScreen())),
                    const SizedBox(height: TSizes.spaceBtwSections),
                ],
              )
            ),

            //body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // - Acount Setings
                  const TSectionHeading(title: 'Configuracion de cuenta', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  const TSetingsMenuTitle(icon: Iconsax.safe_home, title: 'Mi dirección', subTitle: 'Selecciona una dirección de envió'),
                  const TSetingsMenuTitle(icon: Iconsax.shopping_cart, title: 'Mi carrito', subTitle: 'Agrega, remueve productos y ve al pago'),
                  const TSetingsMenuTitle(icon: Iconsax.bag_tick, title: 'Mis ordenes', subTitle: 'Estatus de las ordenes'),
                  const TSetingsMenuTitle(icon: Iconsax.bank, title: 'Cuenta de banco', subTitle: 'Consulta el balance de tu cuenta bancaria'),
                  const TSetingsMenuTitle(icon: Iconsax.discount_shape, title: 'Mis cupones', subTitle: 'Listado de todos los cupones de descuento'),
                  const TSetingsMenuTitle(icon: Iconsax.notification, title: 'Notificaciones', subTitle: 'Configura cualquier mensaje de notificación'),
                  const TSetingsMenuTitle(icon: Iconsax.security_card, title: 'Privacidad de la cuenta', subTitle: 'Maneja los datos de usuario y cuentas conectadas'),

                  // - App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: "Configuraciones de la Aplicación", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSetingsMenuTitle(icon: Iconsax.document_upload, title: 'Cargar datos', subTitle: 'Selecciona una dirección de envió'),

                  TSetingsMenuTitle(
                    icon: Iconsax.security_user, 
                    title: 'Modo seguro', 
                    subTitle: 'Activa el modo apto para todas las edades',
                    trailing: Switch(value: false, onChanged: (value){}),
                  ),
                  TSetingsMenuTitle(
                    icon: Iconsax.image, 
                    title: 'Calidad de las Images HD', 
                    subTitle: 'Configura la calidad de las imágenes ',
                    trailing: Switch(value: false, onChanged: (value){}),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Botón de cambio de contraseña
                  TSetingsMenuTitle(
                    icon: Iconsax.lock,
                    title: 'Cambio de Contraseña',
                    subTitle: 'Cambia tu contraseña de usuario',
                    onTap: () => Get.to(() => ChangePasswordScreen()), // Navegar a la pantalla de cambio de contraseña
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
