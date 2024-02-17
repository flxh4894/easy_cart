import 'package:easy_cart/components/badge/badge.dart';
import 'package:easy_cart/components/border_container.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:easy_cart/views/new_cart/main.dart';
import 'package:easy_cart/views/root/fragments/bubble.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CartRow extends ConsumerWidget {
  const CartRow({
    super.key,
    required this.cart,
  });

  final Cart cart;

  TempCategory convert(String name) {
    switch (name) {
      case "식료품":
        return TempCategory.food;
      case "의류":
        return TempCategory.clothes;
      case "기타":
        return TempCategory.etc;
      default:
        return TempCategory.etc;
    }
  }

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
                        value: cart.currentCnt.toDouble(),
                        color: EasyCartColorMap().primary,
                      ),
                      PieChartSectionData(
                        radius: 10,
                        showTitle: false,
                        value: (cart.totalCnt - cart.currentCnt) == 0
                            ? 100
                            : (cart.totalCnt - cart.currentCnt).toDouble(),
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
                    Row(
                      children: [
                        Text(
                          cart.title,
                          style: context.bodyLargeBold,
                        ),
                        const SizedBox(width: 12),
                        EcBadge(category: convert(cart.category)),
                      ],
                    ),
                    Text(
                      DateFormat(formatString).format(cart.date),
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
          Offstage(
            offstage: cart.totalCnt == 0,
            child: Column(
              children: [
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
          ),
        ],
      ),
    );
  }
}
