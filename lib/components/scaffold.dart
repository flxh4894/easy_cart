import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/model/store_model.dart';
import 'package:easy_cart/provider/home_provider.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EasyCartScaffold extends ConsumerWidget {
  EasyCartScaffold({
    super.key,
    this.backgroundColor,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.isBack,
    this.title,
    this.backActions,
  });

  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool? isBack;
  final String? title;
  final Widget? backActions;

  bool get _isBack => isBack ?? false;
  final TextEditingController controller = TextEditingController();

  factory EasyCartScaffold.back({
    required Widget body,
    Color? backgroundColor,
    Widget? bottomNavigationBar,
    bool? resizeToAvoidBottomInset,
    String? title,
    required Widget backActions,
  }) {
    return EasyCartScaffold(
      body: body,
      isBack: true,
      title: title,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomNavigationBar: bottomNavigationBar,
      backActions: backActions,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor ?? EasyCartColorMap().white,
        appBar: appBar ??
            AppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              centerTitle: true,
              title: title == null ? null : Text(title!),
              titleTextStyle: context.headline2,
              iconTheme: IconThemeData(
                color: EasyCartColorMap().gray.shade300,
              ),
              actionsIconTheme: IconThemeData(
                color: EasyCartColorMap().gray.shade300,
              ),
              leading: _isBack
                  ? IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new),
                    )
                  : null,
              actions: _isBack
                  ? [
                      backActions ?? const Offstage(),
                    ]
                  : [
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(L.current.AddCart),
                                content: TextFormField(
                                  autofocus: true,
                                  controller: controller,
                                  decoration: InputDecoration(
                                    hintText: L.current.AddCartInputHint,
                                  ),
                                  keyboardType: TextInputType.text,
                                  onEditingComplete: () {
                                    addStore(ref);
                                    Navigator.pop(context);
                                  },
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      addStore(ref);
                                      Navigator.pop(context);
                                    },
                                    child: Text(L.current.Add),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(L.current.Cancel),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(L.current.AddStore),
                      ),
                    ],
            ),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  void addStore(WidgetRef ref) {
    if (controller.text.isEmpty) return;

    final StoreModel m = StoreModel(title: controller.text);
    ref.read(homeProvider.notifier).add(m);
  }
}
