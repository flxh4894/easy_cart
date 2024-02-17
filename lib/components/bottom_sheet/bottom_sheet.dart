import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';

///
/// Base Bottom Sheet
///
class EcBottomSheet extends StatelessWidget {
  EcBottomSheet({
    super.key,
    required List<Widget> child,
    this.crossAxisAlignment,
    EdgeInsetsGeometry? padding,
  })  : assert(child.isNotEmpty),
        _child = child,
        _padding = padding;

  final List<Widget> _child;
  final EdgeInsetsGeometry? _padding;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: EasyCartColorMap().surfaceColor,
      ),
      child: SafeArea(
        top: false,
        child: Container(
          padding: _padding ?? const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: _child,
          ),
        ),
      ),
    );
  }
}
