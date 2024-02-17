import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/material.dart';

///
/// 공통 컴포넌트
/// InputField
///
class EasyCartTextInput extends StatelessWidget {
  const EasyCartTextInput({
    this.hint,
    this.focusNode,
    this.controller,
    this.readOnly,
    this.textInputAction,
    this.onEditingComplete,
    this.onChange,
    this.onTap,
    this.keyboardType,
    this.validator,
    this.suffix,
    this.suffixIconConstraints,
    this.maxLength,
    this.initialValue,
    this.autofocus,
    this.style,
    this.label,
    super.key,
  });

  final bool? readOnly;
  final Function()? onEditingComplete;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final String? hint;
  final String? label;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Widget? suffix;
  final BoxConstraints? suffixIconConstraints;
  final int? maxLength;
  final TextEditingController? controller;
  final String? initialValue;
  final bool? autofocus;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onTap: onTap,
      focusNode: focusNode,
      autofocus: autofocus ?? false,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffix,
        suffixIconConstraints: suffixIconConstraints,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: EasyCartColorMap().gray.shade300,
          ),
        ),
        hintText: hint,
        hintStyle: context.subtitle1!
            .copyWith(color: EasyCartColorMap().gray.shade400),
        labelText: label,
        labelStyle: context.subtitle1!
            .copyWith(color: EasyCartColorMap().gray.shade400),
        counterText: "",
        isDense: true,
        focusColor: EasyCartColorMap().primary,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: EasyCartColorMap().gray.shade300,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: readOnly == true
                ? EasyCartColorMap().gray.shade300
                : EasyCartColorMap().primary,
          ),
        ),
      ),
      style: style ??
          Theme.of(context).textTheme.titleMedium!.copyWith(
                color: (readOnly ?? false) == false
                    ? EasyCartColorMap().gray.shade900
                    : EasyCartColorMap().gray.shade400,
              ),
      readOnly: readOnly ?? false,
      validator: validator,
      onEditingComplete: onEditingComplete,
      onChanged: onChange,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      maxLength: maxLength,
    );
  }
}
