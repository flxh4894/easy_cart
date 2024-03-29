import 'package:easy_cart/src/cart/service.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/src/keyword/service.dart';
import 'package:easy_cart/util/logger.dart';
import 'package:get_it/get_it.dart';

class CartUseCase {
  final service = GetIt.I.get<CartService>();
  final keywordService = GetIt.I.get<KeywordService>();

  Future<void> add(CartsCompanion entity) async {
    final repo = service.repo;

    await repo.add(entity);
  }

  ///
  /// 전체 카트 목록 가져오기
  ///
  Future<List<Cart>> getAll() async {
    try {
      final repo = service.repo;
      return await repo.getCarts();
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///
  /// 장보기 진행중 카트 목록 가져오기
  ///
  Future<List<Cart>> getIngList() async {
    try {
      final repo = service.repo;
      final list = await repo.getCarts();
      return list.where((element) => !element.isDone).toList();
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///
  /// 완료된 목록 가져오기
  ///
  Future<List<Cart>> getDoneList() async {
    try {
      final repo = service.repo;
      final list = await repo.getCarts();
      return list.where((element) => element.isDone).toList();
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  Future<void> updateCartCount({
    required int total,
    required int current,
    required int cartId,
  }) async {
    final repo = service.repo;
    await repo.updateCart(
      total: total,
      current: current,
      cartId: cartId,
    );
  }

  Future<void> updateCartFlag({
    required bool isDone,
    required int cartId,
  }) async {
    final repo = service.repo;
    await repo.updateCart(
      cartId: cartId,
      isDone: isDone,
    );
  }

  Future<void> deleteCart(int cartId) async {
    final repo = service.repo;
    await repo.deleteCart(cartId);
  }

  ///
  /// 상세페이지 목록 가져오기 (전체)
  ///
  Future<List<CartItem>> getDetailItems(int cartId) async {
    try {
      final repo = service.repo;
      return await repo.getCartItems(cartId);
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }

  ///
  /// 상세페이지 아이템(Each) 추가
  ///
  Future<bool> addCartItem(CartItemsCompanion item) async {
    try {
      final repo = service.repo;
      final keywordRepo = keywordService.repo;
      await repo.addItem(item);
      await keywordRepo.add(
        KeywordsCompanion.insert(keyword: item.title.value),
      );
      return true;
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  ///
  /// 상세페이지 아이템(Each) 업데이트
  ///
  Future<bool> updateCartItem(CartItemsCompanion item) async {
    try {
      final repo = service.repo;
      await repo.updateItem(item);
      return true;
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }

  Future<bool> deleteCartItem(int id) async {
    try {
      final repo = service.repo;
      await repo.deleteItem(id);
      return true;
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}
