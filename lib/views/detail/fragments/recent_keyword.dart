import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/material.dart';

class RecentKeywordArea extends StatelessWidget {
  const RecentKeywordArea({
    super.key,
    required this.onTap,
    required this.data,
  });

  final Function(String) onTap;
  final List<Keyword> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          L.current.Recent_Keyword,
          style: context.bodyText1,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: data
              .map(
                (e) => GestureDetector(
                  onTap: () => onTap(e.keyword),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: EasyCartColorMap().gray.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      e.keyword,
                      style: context.bodyText2,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
