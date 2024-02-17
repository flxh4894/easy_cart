import 'package:easy_cart/components/input/text_form_feild.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/provider/cart/cart.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputArea extends ConsumerWidget {
  InputArea({
    super.key,
    required this.cartId,
  });

  final int cartId;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cartDetailProvider(cartId));

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: EasyCartColorMap().gray.shade200,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: EasyCartTextInput(
              hint: "물건을 입력해 주세요.",
              focusNode: _focusNode,
              controller: _controller,
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                (Set<MaterialState> states) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  );
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  return EasyCartColorMap().primary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return EasyCartColorMap().modeStateOverlay.white.pressed;
                  }

                  return null;
                },
              ),
            ),
            onPressed: () async {
              await ref
                  .read(cartDetailProvider(cartId).notifier)
                  .addItems(_controller.text);
              _controller.clear();
              _focusNode.requestFocus();
            },
            child: Text(
              L.current.Add,
              style: context.label1.copyWith(color: EasyCartColorMap().white),
            ),
          ),
        ],
      ),
    );
  }
}
