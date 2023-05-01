import 'dart:developer';

import 'package:easy_cart/components/modal/dropdown.dart';
import 'package:easy_cart/main.dart';
import 'package:easy_cart/model/store_model.dart';
import 'package:easy_cart/style/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Home Row
///
class EasyRow extends ConsumerWidget {
  const EasyRow({required this.storeModel, required this.idx, super.key});

  final StoreModel storeModel;
  final int idx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double per = storeModel.doneCnt == 0
        ? 0
        : storeModel.doneCnt / storeModel.totalCnt * 100;

    List<PieChartSectionData> createPieChartSections() {
      return [
        PieChartSectionData(
          radius: 10,
          showTitle: false,
          value: per,
          color: storeModel.isDone ? Colors.green : EasyCartColorMap().primary,
        ),
        PieChartSectionData(
          radius: 10,
          showTitle: false,
          value: 100 - per,
          color: EasyCartColorMap().gray.shade200,
        ),
      ];
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: Colors.white,
        leading: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          child: PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sections: createPieChartSections(),
              centerSpaceRadius: 10,
            ),
          ),
        ),
        title: Text(
          storeModel.title,
          style: context.headline3!.copyWith(
            decoration: storeModel.isDone ? TextDecoration.lineThrough : null,
            color: storeModel.isDone ? EasyCartColorMap().gray.shade400 : null,
          ),
        ),
        // subtitle: Text("${storeModel.doneCnt} / ${storeModel.totalCnt}"),
        subtitle: storeModel.isDone
            ? Text(storeModel.doneAt)
            : Text("${storeModel.doneCnt} / ${storeModel.totalCnt}"),
        trailing: ECDropDown(
          store: storeModel,
        ),
      ),
    );
  }
}
