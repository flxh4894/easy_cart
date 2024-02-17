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
    this.appBarTitle,
    this.body,
    this.bottomNavigationBar,
  });

  final bool canPop;
  final bool automaticallyImplyLeading;
  final String? appBarTitle;

  final Widget? body;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        if (didPop) return;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => context.pop(),
          ),
          centerTitle: true,
          title: appBarTitle != null
              ? Text(
                  appBarTitle!,
                  style: context.bodyLargeBold,
                )
              : null,
        ),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
