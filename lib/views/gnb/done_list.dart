import 'package:easy_cart/components/row/row.dart';
import 'package:easy_cart/detail.dart';
import 'package:easy_cart/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Home Page
///
class DoneListPage extends ConsumerWidget {
  const DoneListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...ref.watch(doneListProvider).map(
            (storeModel) {
              final int idx = ref.read(homeProvider).indexOf(storeModel);
              return GestureDetector(
                key: Key(storeModel.toString()),
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreDetailPage(
                        model: storeModel,
                        stateIndex: idx,
                      ),
                    ),
                  );
                },
                child: EasyRow(
                  storeModel: storeModel,
                  idx: idx,
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
