import 'package:easy_cart/detail.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/model/store_detail_model.dart';
import 'package:easy_cart/provider/detail_provider.dart';
import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Item Row
///
class ItemRow extends ConsumerWidget {
  const ItemRow({
    required this.storeDetailModel,
    required this.p,
    required this.animation,
    super.key,
  });
  final StoreDetailModel storeDetailModel;
  final StoreDetailProvider p;
  final Animation animation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ).chain(CurveTween(curve: Curves.easeInOut)),
      ),
      child: SizeTransition(
        sizeFactor: animation.drive(
          Tween<double>(
            begin: 0,
            end: 1,
          ).chain(CurveTween(curve: Curves.easeInOut)),
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onLongPress: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(L.current.ItemDelete),
                  actions: [
                    TextButton(
                      onPressed: () {
                        int currentIndex =
                            ref.read(p).indexOf(storeDetailModel);
                        listKey.currentState?.removeItem(
                          currentIndex,
                          (context, animation) => ItemRow(
                              storeDetailModel: storeDetailModel,
                              p: p,
                              animation: animation),
                        );
                        ref.read(p.notifier).removeAt(currentIndex);
                        ref.read(p.notifier).updateState();
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
          },
          child: Container(
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
              onTap: () {
                int currentIndex = ref.read(p).indexOf(storeDetailModel);
                int len = ref.read(p).length;

                /// 상태업데이트가 not인 이유는 다음과 같음.
                /// 먼저 상태를 변경하게 되면 indexOf로 일치하는 모델을 찾을 수 없기 때문
                final insertIdx = !storeDetailModel.isDone ? (len - 1) : 0;
                listKey.currentState?.removeItem(
                  currentIndex,
                  (context, animation) => ItemRow(
                      storeDetailModel: storeDetailModel,
                      p: p,
                      animation: animation),
                );
                ref.read(p.notifier).removeAt(currentIndex);
                ref.read(p.notifier).insert(insertIdx, storeDetailModel);
                listKey.currentState?.insertItem(insertIdx);

                // Flag Change
                ref.read(p.notifier).changeFlag(storeDetailModel);
              },
              tileColor: Colors.white,
              title: Text(storeDetailModel.title),
              trailing: Icon(
                Icons.check_circle_outlined,
                size: 32,
                color: storeDetailModel.isDone
                    ? EasyCartColorMap().primary
                    : EasyCartColorMap().gray.shade300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
