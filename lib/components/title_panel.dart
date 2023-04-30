import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';

///
/// (공통) 상단 타이틀 패널
///
class TitlePanel extends StatelessWidget {
  const TitlePanel({
    super.key,
    required this.title,
    this.desc,
    this.descColor,
  });

  final String title;
  final String? desc;
  final Color? descColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          if (desc != null)
            Text(
              desc!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: descColor ?? EasyCartColorMap().gray.shade500,
                  ),
            ),
        ],
      ),
    );
  }
}
