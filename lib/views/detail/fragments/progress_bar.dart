import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.done,
    required this.total,
  });

  final int done;
  final int total;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              width: size.maxWidth,
              height: 10,
              decoration: BoxDecoration(
                color: EasyCartColorMap().gray.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              width: size.maxWidth * (done / total),
              height: 10,
              decoration: BoxDecoration(
                color: EasyCartColorMap().primary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      );
    });
  }
}
