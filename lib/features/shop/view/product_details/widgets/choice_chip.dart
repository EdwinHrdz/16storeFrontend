import 'package:flutter/material.dart';
import 'package:store16/common/widgets/custum_shapes/containers/circular_container.dart';
import 'package:store16/utils/constants/colors.dart';
import 'package:store16/utils/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key, 
    required this.text, 
    required this.selected, 
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {

    final hasColor = THelperFunctions.getColor(text);

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: hasColor != null ? const SizedBox() : Text(text), 
        selected: selected, 
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: hasColor != null 
          ? TCircularContainer(width: 50, height: 50, backgroundColor: THelperFunctions.getColor(text)!)  
          : null,
          
        labelPadding: hasColor != null 
          ? const EdgeInsets.all(0) 
          : null,
        padding: hasColor != null 
          ? const EdgeInsets.all(0) 
          : null,
        shape: hasColor != null 
          ? const CircleBorder() 
          : null,
        backgroundColor: hasColor != null 
          ? Colors.green 
          : null,
      ),
    );
  }
}