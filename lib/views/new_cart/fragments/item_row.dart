import 'package:easy_cart/components/input/text_form_feild.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/material.dart';

class AddItemRow extends StatelessWidget {
  const AddItemRow({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.readOnly = false,
    this.autoFocus = false,
    this.showSuffix = false,
    this.style,
    this.onTap,
    this.onChange,
  });

  final bool autoFocus;
  final TextEditingController controller;
  final String label;
  final String? hint;
  final Function(String v)? onChange;

  final bool readOnly;
  final TextStyle? style;
  final VoidCallback? onTap;
  final bool showSuffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.bodyText1!.copyWith(
            color: EasyCartColorMap().gray.shade500,
          ),
        ),
        EasyCartTextInput(
          autofocus: autoFocus,
          controller: controller,
          readOnly: readOnly,
          style: style,
          onTap: onTap,
          hint: hint,
          onChange: onChange,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 20,
            minHeight: 20,
          ),
          suffix: showSuffix
              ? RotationTransition(
                  turns: const AlwaysStoppedAnimation(270 / 360),
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: EasyCartColorMap().gray.shade500,
                    size: 16,
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
