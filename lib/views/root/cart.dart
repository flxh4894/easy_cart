import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      ),
      body: const Center(
        child: Text('Cart'),
      ),
    );
  }
}
