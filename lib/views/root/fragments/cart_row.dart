import 'package:easy_cart/components/border_container.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:easy_cart/views/root/fragments/bubble.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartRow extends ConsumerWidget {
  const CartRow({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BorderContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: PieChart(
                  PieChartData(
                    startDegreeOffset: -90,
                    sections: [
                      PieChartSectionData(
                        radius: 10,
                        showTitle: false,
                        value: 40,
                        color: EasyCartColorMap().primary,
                      ),
                      PieChartSectionData(
                        radius: 10,
                        showTitle: false,
                        value: 60,
                        color: EasyCartColorMap().gray.shade200,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.bodyLargeBold,
                    ),
                    Text(
                      "2024.02.15(목)",
                      style: context.bodyText2!.copyWith(
                        color: EasyCartColorMap().gray.shade500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: EasyCartColorMap().gray.shade500,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 12),
          LayoutBuilder(builder: (context, size) {
            return CustomPaint(
              painter: ContractListStatusBubble(),
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Text(
                  "아직 n개의 물건이 남아있어요.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: EasyCartColorMap().gray.shade500),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
