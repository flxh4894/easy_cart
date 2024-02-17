import 'package:drift/drift.dart';
import 'package:easy_cart/src/cart/use_case.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_cart.g.dart';

@riverpod
class NewCart extends _$NewCart {
  final uc = GetIt.I.get<CartUseCase>();

  @override
  CartsCompanion build() {
    return const CartsCompanion(
      category: Value(""),
      title: Value(""),
    );
  }

  void setState(CartsCompanion entity) {
    state = entity;
  }

  Future<void> add() async {
    assert(state.title.value != "");
    await uc.add(state);
  }
}

@riverpod
bool isNewCartCtaPossible(IsNewCartCtaPossibleRef ref) {
  return ref.watch(newCartProvider).title.value != "";
}
