import 'package:easy_cart/provider/cart/cart.dart';
import 'package:easy_cart/routes/new_routes.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/views/root/fragments/cart_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///
/// Root Tab
/// Cart
///
class CartMainPage extends ConsumerStatefulWidget {
  const CartMainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartMainPageState();
}

class _CartMainPageState extends ConsumerState<CartMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: EasyCartColorMap().primary,
            ),
            onPressed: () => context.push(EcRoute.createCart.path),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ref.watch(cartListProvider).when(
              data: (data) {
                return SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 16,
                    children: [
                      ...data.map(
                        (cart) => CartRow(
                          cart: cart,
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) => const CircularProgressIndicator(),
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}
