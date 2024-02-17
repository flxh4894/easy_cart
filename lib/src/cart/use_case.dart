import 'package:easy_cart/src/cart/service.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CartUseCase {
  final service = GetIt.I.get<CartService>();

  Future<void> add(CartsCompanion entity) async {
    final repo = service.repo;

    await repo.add(entity);
  }

  Future<List<Cart>> getAll() async {
    try {
      final repo = service.repo;
      return await repo.getAll();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<void> getSingle() async {}
}
