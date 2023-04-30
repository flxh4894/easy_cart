import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    super.key,
    required this.child,
    this.margin,
  });

  final Widget child;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(
          color: EasyCartColorMap().gray.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
