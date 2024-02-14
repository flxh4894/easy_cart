import 'package:easy_cart/components/border_container.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:easy_cart/views/root/fragments/cart_row.dart';
import 'package:fl_chart/fl_chart.dart';
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: EasyCartColorMap().primary,
            ),
            onPressed: () {
              // Navigator.of(context).pushNamed(EcRoute.done.path);
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const SingleChildScrollView(
          child: Wrap(
            runSpacing: 16,
            children: [
              CartRow(
                title: "다이소",
              ),
              CartRow(
                title: "이마트",
              ),
              CartRow(
                title: "홈플러스",
              ),
              CartRow(
                title: "정육점",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
