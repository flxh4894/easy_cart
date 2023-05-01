import 'dart:developer';
import 'package:easy_cart/components/row/row_with_check.dart';
import 'package:easy_cart/components/scaffold.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/main.dart';
import 'package:easy_cart/model/store_detail_model.dart';
import 'package:easy_cart/model/store_model.dart';
import 'package:easy_cart/provider/detail_provider.dart';
import 'package:easy_cart/provider/home_provider.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/util/hash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// animation list key
GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

///
/// Store Detail Page
///
class StoreDetailPage extends ConsumerWidget {
  const StoreDetailPage({
    required this.model,
    required this.stateIndex,
    super.key,
  });

  final StoreModel model;
  final int stateIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = StoreDetailProvider(childKey: model.childKey);
    final list = ref.watch(p);
    return EasyCartScaffold.back(
      title: model.title,
      backActions: TextButton(
        onPressed: () {
          final m = ref.read(homeProvider)[stateIndex];
          log(stateIndex.toString());
          ref.read(homeProvider.notifier).doneStore(m);
          Navigator.pop(context);
        },
        child: Text(L.current.StoreDone),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            _ProgressBar(p: p),
            Expanded(
              child: AnimatedList(
                key: listKey,
                initialItemCount: ref.watch(p).length,
                itemBuilder: (context, index, animation) {
                  return ItemRow(
                    animation: animation,
                    storeDetailModel: list[index],
                    p: p,
                    key: Key(makeHash(model.hashCode)),
                  );
                },
              ),
            ),
            CtaRow(p: p),
          ],
        ),
      ),
    );
  }
}

class _ProgressBar extends ConsumerWidget {
  const _ProgressBar({
    required this.p,
  });

  final StoreDetailProvider p;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int isDoneCnt = ref.read(p).where((element) => element.isDone).length;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: LayoutBuilder(builder: (context, size) {
        final double w =
            (isDoneCnt == 0) ? 0 : (size.maxWidth / ref.read(p).length);

        return Stack(
          children: [
            Container(
              width: size.maxWidth,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: EasyCartColorMap().gray.shade200,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              width: w * isDoneCnt,
              height: 10,
              decoration: BoxDecoration(
                color: EasyCartColorMap().primary,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ],
        );
      }),
    );
  }
}

///
/// CTA
///
class CtaRow extends ConsumerWidget {
  CtaRow({
    required this.p,
    super.key,
  });

  final TextEditingController c = TextEditingController();
  final StoreDetailProvider p;
  final ValueNotifier<bool> keyboardFlag = ValueNotifier(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(p).where((element) => element.isDone).length;
    final total = ref.watch(p).length;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            color: EasyCartColorMap().primary,
            child: Text(
              "$current / $total",
              style:
                  context.bodyText1!.copyWith(color: EasyCartColorMap().white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: c,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: L.current.ItemInputHint,
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.all(8),
                    ),
                    onEditingComplete: () => addItem(ref),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        keyboardFlag.value = false;
                      } else {
                        keyboardFlag.value = true;
                      }
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: keyboardFlag,
                  builder: (context, value, child) {
                    return value
                        ? IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.arrow_upward,
                              color: EasyCartColorMap().primary,
                              size: 32,
                            ),
                            onPressed: () => addItem(ref),
                          )
                        : IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: EasyCartColorMap().gray.shade500,
                              size: 32,
                            ),
                            onPressed: () => FocusScope.of(context).unfocus(),
                          );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 아이템 추가
  void addItem(WidgetRef ref) {
    if (c.text.isEmpty) return;

    ref.read(p.notifier).add(StoreDetailModel(title: c.text));
    listKey.currentState?.insertItem(0);
  }
}

class StoreDetailArg {
  const StoreDetailArg({
    required this.model,
    required this.index,
  });

  final StoreModel model;
  final int index;
}
