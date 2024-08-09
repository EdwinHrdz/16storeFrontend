import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key, 
    this.currencySing = '\$', 
    required this.price, 
    this.maxLines = 1, 
    this.isLarge = false, 
    this.lineThough = false,
  });

  final String currencySing, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySing + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
        ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThough ? TextDecoration.lineThrough : null)
        : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThough ? TextDecoration.lineThrough : null)
    );
  }
}