import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// (공통) 텍스트 인풋 컴포넌트
///
class EasyCartTextInput extends ConsumerWidget {
  const EasyCartTextInput({
    this.autofocus,
    this.readOnly,
    this.enabled,
    this.validator,
    this.keyboardType,
    this.onEditingComplete,
    this.onTap,
    this.hintText,
    this.onChanged,
    this.controller,
    this.focusNode,
    super.key,
  });

  final bool? autofocus;
  final bool? readOnly;
  final bool? enabled;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final String? hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      autofocus: true,
      autovalidateMode: AutovalidateMode.always,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: EasyCartColorMap().gray.shade300,
            ),
        isDense: true,
      ),
    );
  }
}
