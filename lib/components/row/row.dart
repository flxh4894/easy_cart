import 'package:easy_cart/components/modal/dropdown.dart';
import 'package:easy_cart/model/store_model.dart';
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
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            (idx + 1).toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(storeModel.title),
        subtitle: Text("${storeModel.doneCnt} / ${storeModel.totalCnt}"),
        trailing: ECDropDown(
          store: storeModel,
        ),
        // trailing: IconButton(
        //   padding: EdgeInsets.zero,
        //   onPressed: () {},
        //   icon: const Icon(Icons.more_vert_outlined, size: 32),
        // ),
      ),
    );
  }
}
