import 'package:easy_cart/components/badge/badge.dart';
import 'package:easy_cart/components/container/border_container.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/provider/cart/cart.dart';
import 'package:easy_cart/routes/new_routes.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:easy_cart/views/new_cart/main.dart';
import 'package:easy_cart/views/root/fragments/bubble.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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

  double getPercent() {
    if (cart.totalCnt == 0) return 0.0;
    return cart.currentCnt / cart.totalCnt;
  }

  double getTotalPercent() {
    if (cart.totalCnt == 0) return 1.0;
    return 1 - (cart.currentCnt / cart.totalCnt);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BorderContainer(
      onTap: () => context
          .push("${EcRoute.detail.path}/${cart.id}", extra: cart.title)
          .then((value) async {
        await ref.read(cartListProvider.notifier).refresh();
      }),
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
                        value: getPercent(),
                        color: EasyCartColorMap().primary,
                      ),
                      PieChartSectionData(
                        radius: 10,
                        showTitle: false,
                        value: getTotalPercent(),
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
                        const SizedBox(width: 4),
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
            offstage: cart.totalCnt == 0 || cart.currentCnt == cart.totalCnt,
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
                        L.current.Cart_Badege_Title(
                          cart.totalCnt - cart.currentCnt,
                        ),
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
          Offstage(
            offstage: cart.totalCnt != 0,
            child: Column(
              children: [
                const SizedBox(height: 12),
                LayoutBuilder(builder: (context, size) {
                  return CustomPaint(
                    painter: ContractListStatusBubble(
                      color: EasyCartColorMap().benchmark.snp500,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        L.current.Cart_Badege_NoItem_Title,
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
