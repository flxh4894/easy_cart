import 'package:easy_cart/src/cart/use_case.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/util/logger.dart';
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
    logger.w("?????");
    state = AsyncData(await uc.getAll());
  }
}
