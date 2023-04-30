import 'package:easy_cart/components/row/row.dart';
import 'package:easy_cart/detail.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/model/store_model.dart';
import 'package:easy_cart/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Home Page
///
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ReorderableListView(
            onReorder: (oldIndex, newIndex) =>
                ref.read(homeProvider.notifier).onReorder(oldIndex, newIndex),
            children: ref
                .watch(homeProvider)
                .map(
                  (storeModel) => GestureDetector(
                    key: Key(storeModel.toString()),
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreDetailPage(
                            model: storeModel,
                          ),
                        ),
                      );
                    },
                    child: EasyRow(
                      storeModel: storeModel,
                      idx: ref.read(homeProvider).indexOf(storeModel),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  // Delete Modal
  Future<dynamic> _showDeleteModal(
      BuildContext context, WidgetRef ref, StoreModel e) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(L.current.ItemDelete),
          actions: [
            TextButton(
              onPressed: () {
                final currentIdx = ref.read(homeProvider).indexOf(e);
                ref.read(homeProvider.notifier).delete(currentIdx);
                Navigator.pop(context);
              },
              child: Text(L.current.Yes),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(L.current.No),
            ),
          ],
        );
      },
    );
  }
}
