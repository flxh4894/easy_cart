import 'package:easy_cart/src/cart/service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CartUseCase {
  final service = GetIt.I.get<CartService>();

  Future<void> addAndGetData() async {
    final repo = service.repo;

    await repo.add(1004);

    debugPrint('Data: ${await repo.getAll()}');
  }

  Future<void> getSingle() async {}
}
