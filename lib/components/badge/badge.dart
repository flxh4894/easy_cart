import 'package:easy_cart/style/theme.dart';
import 'package:easy_cart/views/new_cart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EcBadge extends ConsumerWidget {
  const EcBadge({
    super.key,
    required this.category,
  });

  final TempCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: category.color,
          width: 1,
        ),
      ),
      child: Text(
        category.name,
        style: context.subtitle4.copyWith(color: category.color),
      ),
    );
  }
}
