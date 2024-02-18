import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///
/// Base Scaffold
///
class EcScaffold extends ConsumerWidget {
  const EcScaffold({
    super.key,
    this.canPop = true,
    this.automaticallyImplyLeading = true,
    this.resizeToAvoidBottomInset = false,
    this.appBarTitle,
    this.body,
    this.bottomNavigationBar,
    this.appBarActions,
    this.isCenterTitle,
  });

  final bool canPop;
  final bool automaticallyImplyLeading;
  final bool resizeToAvoidBottomInset;
  final String? appBarTitle;
  final bool? isCenterTitle;

  final Widget? body;
  final Widget? bottomNavigationBar;
  final List<Widget>? appBarActions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        if (didPop) return;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: AppBar(
          scrolledUnderElevation: 1,
          surfaceTintColor: Colors.transparent,
          shadowColor: EasyCartColorMap().gray.shade200,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: !context.canPop()
              ? null
              : IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () => context.pop(),
                ),
          centerTitle: isCenterTitle ?? true,
          title: appBarTitle != null
              ? Text(
                  appBarTitle!,
                  style: context.bodyLargeBold,
                )
              : null,
          actions: appBarActions,
        ),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
