import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// 테두리가 있는 컨테이너
///
class BorderContainer extends ConsumerWidget {
  const BorderContainer({
    required this.child,
    this.borderColor,
    this.margin,
    this.padding,
    this.width,
    super.key,
  });
  final Widget child;
  final Color? borderColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 20),
      padding: padding ?? const EdgeInsets.all(16),
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? EasyCartColorMap().gray.shade300,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
