import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:store16/common/widgets/images/circular_image.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/image_strings.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed; 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(image: TImages.user1, width: 50, height: 50, padding: 0),
      title: Text('Edwin Hernandez', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text('Edwin.Hernandez@example.com', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit), color: TColors.white,),
    );
  }
}