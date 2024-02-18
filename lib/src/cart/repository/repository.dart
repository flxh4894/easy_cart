import 'package:drift/drift.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:get_it/get_it.dart';

abstract class $CartRepository {
  Future<void> add(CartsCompanion entity);
  Future<void> updateCart({
    required int cartId,
    int? total,
    int? current,
    bool? isDone,
  });
  Future<void> deleteCart(int cartId);
  Future<List<Cart>> getCarts();
  Future<List<CartItem>> getCartItems(int cartId);
  Future<void> addItem(CartItemsCompanion item);
  Future<void> updateItem(CartItemsCompanion item);
  Future<void> deleteItem(int cartId);
}

class CartRepository extends $CartRepository {
  final db = GetIt.instance.get<AppDatabase>();

  @override
  Future<void> add(CartsCompanion entity) async {
    await db.into(db.carts).insert(entity);
  }

  @override
  Future<List<Cart>> getCarts() async {
    return await db.select(db.carts).get();
  }

  @override
  Future<void> updateCart({
    required int cartId,
    int? total,
    int? current,
    bool? isDone,
  }) async {
    final u = db.update(db.carts)..where((tbl) => tbl.id.equals(cartId));
    await u.write(
      CartsCompanion(
        totalCnt: total == null ? const Value.absent() : Value(total),
        currentCnt: current == null ? const Value.absent() : Value(current),
        isDone: isDone == null ? const Value.absent() : Value(isDone),
      ),
    );
  }

  ///
  /// 상세페이지 CRUD 영역
  ///
  @override
  Future<void> addItem(CartItemsCompanion item) async {
    await db.into(db.cartItems).insert(item);
  }

  @override
  Future<void> updateItem(CartItemsCompanion item) async {
    await db.update(db.cartItems).replace(item);
  }

  @override
  Future<List<CartItem>> getCartItems(int cartId) async {
    return await (db.select(db.cartItems)
          ..where((tbl) => tbl.cartId.equals(cartId)))
        .get();
  }

  @override
  Future<void> deleteItem(int cartId) async {
    final d = db.delete(db.cartItems)..where((tbl) => tbl.id.equals(cartId));
    await d.go();
  }

  @override
  Future<void> deleteCart(int cartId) async {
    final d = db.delete(db.carts)..where((tbl) => tbl.id.equals(cartId));
    await d.go();

    final d2 = db.delete(db.cartItems)
      ..where((tbl) => tbl.cartId.equals(cartId));
    await d2.go();
  }

  ///
  /// ---상세페이지 CRUD 끝---
  ///
}
