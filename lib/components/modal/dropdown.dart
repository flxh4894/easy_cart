import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/main.dart';
import 'package:easy_cart/model/store_model.dart';
import 'package:easy_cart/provider/home_provider.dart';
import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ECDropDownEnum { rename, delete }

extension ECDropDownEnumExtension on ECDropDownEnum {
  String get name {
    switch (this) {
      case ECDropDownEnum.rename:
        return L.current.ECDropDownEnum_Rename;
      case ECDropDownEnum.delete:
        return L.current.ECDropDownEnum_Delete;
    }
  }
}

class ECDropDown extends ConsumerWidget {
  const ECDropDown({
    required this.store,
    super.key,
  });

  final StoreModel store;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      child: const Icon(Icons.more_vert_outlined, size: 32),
      itemBuilder: (BuildContext context) {
        return <String>[
          store.title,
          ...ECDropDownEnum.values.map((e) => e.name),
        ].map((String value) {
          return PopupMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: context.subtitle2!.copyWith(
                color: EasyCartColorMap().gray.shade900,
              ),
            ),
          );
        }).toList();
      },
      onSelected: (String newValue) {
        try {
          ECDropDownEnum temp = ECDropDownEnum.values
              .firstWhere((element) => element.name == newValue);
          final int currentIdx = ref.read(homeProvider).indexOf(store);
          switch (temp) {
            case ECDropDownEnum.rename:
              final TextEditingController c = TextEditingController();
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(L.current.AddCart),
                    content: TextFormField(
                      autofocus: true,
                      controller: c,
                      decoration: InputDecoration(
                        hintText: L.current.AddCartInputHint,
                      ),
                      keyboardType: TextInputType.text,
                      onEditingComplete: () {
                        if (c.text.isEmpty) return;
                        ref
                            .read(homeProvider.notifier)
                            .rename(currentIdx, store.copyWith(title: c.text));
                        Navigator.pop(context);
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (c.text.isEmpty) return;
                          ref.read(homeProvider.notifier).rename(
                              currentIdx, store.copyWith(title: c.text));
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
              break;
            case ECDropDownEnum.delete:
              ref.read(homeProvider.notifier).delete(currentIdx);
              break;
          }
        } catch (e) {
          return;
        }
      },
    );
  }
}
