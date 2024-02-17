import 'package:easy_cart/components/bottom_sheet/bottom_sheet.dart';
import 'package:easy_cart/components/button/new_loading_page_button.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCartBottomSheet extends ConsumerWidget {
  const AddCartBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EcBottomSheet(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: [LoadingPageBottomButton.cta(btnText: L.current.Add)],
    );
  }
}
