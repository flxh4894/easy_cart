import 'package:easy_cart/src/cart/model/enum/action_mode.dart';
import 'package:easy_cart/src/cart/use_case.dart';
import 'package:easy_cart/src/clients/drift.dart';

import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart.g.dart';

@Riverpod(keepAlive: true)
class CartList extends _$CartList {
  final uc = GetIt.I.get<CartUseCase>();

  @override
  FutureOr<List<Cart>> build() async {
    return await uc.getAll();
  }

  Future<void> refresh() async {
    state = AsyncData(await uc.getAll());
  }

  Future<void> deleteCart(int cartId) async {
    await uc.deleteCart(cartId);
    await refresh();
  }

  // Root 카트 최종 수량 업데이트
  Future<void> updateRootCart(
    List<CartItem> list,
    int cartId,
  ) async {
    final doneCount = list.where((element) => element.isDone).length;
    final totalCount = list.length;

    await uc.updateCartCount(
      total: totalCount,
      current: doneCount,
      cartId: cartId,
    );

    final flag = totalCount != 0 && totalCount == doneCount;
    await uc.updateCartFlag(isDone: flag, cartId: cartId);
  }
}

@riverpod
class CartDetail extends _$CartDetail {
  final uc = GetIt.I.get<CartUseCase>();

  @override
  FutureOr<List<CartItem>> build(int cartId) async {
    cartId = cartId;
    final list = await uc.getDetailItems(cartId);
    list.sort((a, b) => a.isDone ? 1 : -1);

    return list;
  }

  CartItem makeCartItem(CartItemsCompanion cart) {
    return CartItem(
      id: cart.id.value,
      cartId: cart.cartId.value,
      title: cart.title.value,
      isDone: cart.isDone.value,
    );
  }

  Future<void> updateRoot(
    List<CartItem> list,
    int cartId,
  ) async {
    await ref.read(cartListProvider.notifier).updateRootCart(
          list,
          cartId,
        );
  }

  Future<void> addItems(String title, {bool? isDone}) async {
    final item = CartItemsCompanion.insert(
      cartId: cartId,
      title: title,
    );

    await uc.addCartItem(item);
    final list = await uc.getDetailItems(cartId);
    list.sort((a, b) => a.isDone ? 1 : -1);

    await updateRoot(
      list,
      cartId,
    );
    state = AsyncData(list);
  }

  Future<void> updateItem(CartItemsCompanion item) async {
    await uc.updateCartItem(item);

    final list = [...state.value!];
    final idx = list.indexWhere((element) => element.id == item.id.value);
    list[idx] = makeCartItem(item);
    list.sort((a, b) => a.isDone ? 1 : -1);

    await updateRoot(
      list,
      cartId,
    );
    state = AsyncData([...list]);
  }

  Future<void> deleteItem(int id) async {
    await uc.deleteCartItem(id);
    final list = [...state.value!];
    list.removeWhere((element) => element.id == id);

    if (list.isEmpty) {
      ref.read(detailActionModeProvider.notifier).toggle();
    }

    await updateRoot(
      list,
      cartId,
    );
    state = AsyncData([...list]);
  }
}

@riverpod
class DetailActionMode extends _$DetailActionMode {
  @override
  ActionMode build() {
    return ActionMode.modify;
  }

  void toggle() {
    if (state == ActionMode.modify) {
      state = ActionMode.done;
    } else {
      state = ActionMode.modify;
    }
  }
}
