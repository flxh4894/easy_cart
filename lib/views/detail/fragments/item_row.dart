import 'package:drift/drift.dart';
import 'package:easy_cart/components/container/border_container.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/provider/cart/cart.dart';
import 'package:easy_cart/src/cart/model/enum/action_mode.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// 장바구니 아이템 항목 Row
///
class ItemRow extends ConsumerWidget {
  const ItemRow({
    super.key,
    required this.cartItem,
    required this.cartId,
  });

  final int cartId;
  final CartItem cartItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final m = ref.watch(detailActionModeProvider);
    return BorderContainer(
      onTap: () async {
        if (m != ActionMode.modify) {
          ref.read(cartDetailProvider(cartId).notifier).deleteItem(cartItem.id);
        } else {
          final newCart = CartItemsCompanion(
            id: Value(cartItem.id),
            cartId: Value(cartItem.cartId),
            title: Value(cartItem.title),
            isDone: Value(!cartItem.isDone),
          );

          await ref
              .read(cartDetailProvider(cartId).notifier)
              .updateItem(newCart);
        }
      },
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              cartItem.title,
              style: context.subtitle2!.copyWith(
                color:
                    cartItem.isDone ? EasyCartColorMap().gray.shade500 : null,
              ),
            ),
          ),
          m != ActionMode.modify
              ? Text(
                  L.current.Delete,
                  style: context.subtitle4
                      .copyWith(color: EasyCartColorMap().primary),
                )
              : Icon(
                  Icons.check_circle_outline,
                  color: cartItem.isDone
                      ? EasyCartColorMap().primary
                      : EasyCartColorMap().gray.shade300,
                )
        ],
      ),
    );
  }
}
