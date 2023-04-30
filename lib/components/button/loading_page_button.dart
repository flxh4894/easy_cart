import 'package:easy_cart/style/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_page_button.g.dart';

class LoadingPageButton extends ConsumerWidget {
  const LoadingPageButton({
    this.btnText,
    required this.onPressed,
    this.isDisabled = false,
    super.key,
  });

  final Function onPressed;
  final String? btnText;
  final bool isDisabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(_btnStateProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
        bottom: 16,
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: (isDisabled || isLoading)
            ? null
            : () async {
                ref.read(_btnStateProvider.notifier).updateFlag();
                await onPressed();
                ref.read(_btnStateProvider.notifier).updateFlag();
              },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        disabledColor: isLoading
            ? Theme.of(context).primaryColor
            : EasyCartColorMap().gray.shade300,
        color: Theme.of(context).primaryColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.white.withOpacity(0.5),
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          height: 56,
          width: double.infinity,
          alignment: Alignment.center,
          child: isLoading
              ? const CupertinoActivityIndicator(
                  color: Colors.white,
                )
              : Text(
                  btnText ?? "확인",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: isDisabled
                          ? EasyCartColorMap().gray.shade500
                          : Colors.white),
                ),
        ),
      ),
    );
  }
}

@riverpod
class _BtnState extends _$BtnState {
  @override
  bool build() {
    return false;
  }

  void updateFlag() {
    state = !state;
  }
}
