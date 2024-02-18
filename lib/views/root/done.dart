import 'package:easy_cart/components/scaffold/scaffold.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/provider/cart/cart.dart';
import 'package:easy_cart/views/root/fragments/cart_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Root Tab
/// Done
///
class DoneMainPage extends ConsumerStatefulWidget {
  const DoneMainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoneMainPageState();
}

class _DoneMainPageState extends ConsumerState<DoneMainPage> {
  @override
  Widget build(BuildContext context) {
    return EcScaffold(
      appBarTitle: L.current.Cart_Done,
      isCenterTitle: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ref.watch(cartListProvider).when(
              data: (data) {
                data = data.where((element) => element.isDone).toList();
                return SingleChildScrollView(
                  child: Wrap(
                    runSpacing: 8,
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
