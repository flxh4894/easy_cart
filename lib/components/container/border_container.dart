import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  BorderContainer({
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
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () async {
          if (_isProgress.value) return;

          _isProgress.value = true;
          await onTap?.call();
          _isProgress.value = false;
        },
        highlightColor: EasyCartColorMap().gray.shade100,
        splashColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: EasyCartColorMap().gray.shade300,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: child,
        ),
      ),
    );
  }
}
