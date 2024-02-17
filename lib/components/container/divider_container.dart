import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DividerContainer extends ConsumerWidget {
  DividerContainer({
    super.key,
    required this.child,
    this.margin,
    this.padding,
    this.onTap,
  });

  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Function()? onTap;

  final ValueNotifier<bool> _isProgress = ValueNotifier(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        if (_isProgress.value) return;

        _isProgress.value = true;
        await onTap?.call();
        _isProgress.value = false;
      },
      child: Container(
        padding: padding ?? const EdgeInsets.all(16),
        margin: margin,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: EasyCartColorMap().gray.shade300,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
