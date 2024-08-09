import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/constants/text_strings.dart';

class TLoginDivider extends StatelessWidget {
  const TLoginDivider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark? TColors.darkGrey : TColors.grey, thickness: 0.5, indent: 40, endIndent: 5)),
        Text(TTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark? TColors.darkGrey : TColors.grey, thickness: 0.5, indent: 5, endIndent: 40)),
      ],
    );
  }
}