import 'package:easy_cart/components/button/new_loading_page_button.dart';
import 'package:easy_cart/components/scaffold/scaffold.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/provider/cart/cart.dart';
import 'package:easy_cart/src/cart/model/enum/action_mode.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:easy_cart/views/detail/fragments/input_area.dart';
import 'package:easy_cart/views/detail/fragments/item_row.dart';
import 'package:easy_cart/views/detail/fragments/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///
/// 메인 > 상세(ID) 물건 목록 페이지
///
class CartDetailPage extends ConsumerWidget {
  const CartDetailPage({
    super.key,
    required this.cartId,
    required this.title,
  });

  final int cartId;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EcScaffold(
      resizeToAvoidBottomInset: true,
      appBarTitle: title,
      appBarActions: [
        Consumer(builder: (context, ref, _) {
          final m = ref.watch(detailActionModeProvider);
          return TextButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              ref.read(detailActionModeProvider.notifier).toggle();
            },
            child: Text(m.name),
          );
        }),
      ],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ref.watch(cartDetailProvider(cartId)).when(
              data: (data) {
                final total = data.length;
                final done = data.where((e) => e.isDone).length;

                return Expanded(
                  child: total != 0
                      ? SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            child: Column(
                              children: [
                                ProgressBar(done: done, total: total),
                                ...data.map(
                                  (e) => ItemRow(
                                    cartItem: e,
                                    cartId: cartId,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            "물건을 추가해주세요.",
                            style: context.subtitle2,
                          ),
                        ),
                );
              },
              error: (error, stackTrace) {
                return const Offstage();
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Consumer(builder: (context, ref, _) {
              final m = ref.watch(detailActionModeProvider);
              return Offstage(
                offstage: m == ActionMode.done,
                child: InputArea(cartId: cartId),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          final m = ref.watch(detailActionModeProvider);
          return Offstage(
            offstage: m == ActionMode.modify,
            child: LoadingPageBottomButton.ctaWithDivider(
              onPressed: () async {
                await ref
                    .read(cartListProvider.notifier)
                    .deleteCart(cartId)
                    .then(
                      (value) => context.pop(),
                    );
              },
              btnText: L.current.ItemDelete,
            ),
          );
        },
      ),
    );
  }
}
