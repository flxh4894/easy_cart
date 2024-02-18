import 'package:easy_cart/components/input/text_form_feild.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/provider/cart/cart.dart';
import 'package:easy_cart/provider/keyword/keyword.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:easy_cart/views/detail/fragments/recent_keyword.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consumer(
            builder: (context, ref, child) {
              return ref.watch(recentKeywordProvider).when(
                data: (data) {
                  return LayoutBuilder(builder: (context, size) {
                    return RecentKeywordArea(
                      onTap: (String keyword) => _controller.text = keyword,
                      data: data,
                    );
                  });
                },
                error: (error, stackTrace) {
                  return const Offstage();
                },
                loading: () {
                  return const Offstage();
                },
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: EasyCartTextInput(
                  hint: L.current.ItemInputHint,
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
                        return EasyCartColorMap()
                            .modeStateOverlay
                            .white
                            .pressed;
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
                  style:
                      context.label1.copyWith(color: EasyCartColorMap().white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
