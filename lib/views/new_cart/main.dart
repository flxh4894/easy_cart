// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:drift/drift.dart' as db;
import 'package:easy_cart/components/bottom_sheet/bottom_sheet.dart';
import 'package:easy_cart/components/button/new_loading_page_button.dart';
import 'package:easy_cart/components/scaffold/scaffold.dart';
import 'package:easy_cart/components/title_panel.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/provider/cart/cart.dart';
import 'package:easy_cart/provider/cart/new_cart.dart';
import 'package:easy_cart/src/clients/drift.dart' as db2;
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:easy_cart/views/new_cart/fragments/date_picker.dart';
import 'package:easy_cart/views/new_cart/fragments/item_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

///
/// 새로운 장바구니 추가 페이지
///
const String formatString = 'yyyy-MM-dd (E)';

class AddNewCartPage extends ConsumerWidget {
  AddNewCartPage({
    super.key,
  });

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController(
    text: TempCategory.food.name,
  );
  final TextEditingController _dateController = TextEditingController(
    text: DateFormat(formatString).format(DateTime.now()),
  );

  void _showDatePicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) =>
          DatePickerBottomSheet(onDateTimeChanged: (date) {
        _dateController.text = date;
      }),
    );
  }

  TempCategory convert(String name) {
    switch (name) {
      case "식료품":
        return TempCategory.food;
      case "의류":
        return TempCategory.clothes;
      case "기타":
        return TempCategory.etc;
      default:
        return TempCategory.etc;
    }
  }

  void _showCategory(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => EcBottomSheet(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        crossAxisAlignment: CrossAxisAlignment.start,
        child: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "카테고리 선택",
              style: context.headline3,
            ),
          ),
          ...TempCategory.values.map(
            (e) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                _categoryController.text = e.name;
                context.pop();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Radio(
                        value: e,
                        groupValue: convert(_categoryController.text),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      e.name,
                      style: context.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(newCartProvider);
    return EcScaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitlePanel(
              title: "새로운 장바구니 추가",
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            Wrap(
              runSpacing: 16,
              children: [
                AddItemRow(
                  autoFocus: true,
                  controller: _titleController,
                  onChange: (v) {
                    ref
                        .read(newCartProvider.notifier)
                        .setState(db2.CartsCompanion(title: db.Value(v)));
                  },
                  label: "어디서 장을 보시나요?",
                  hint: "예) 이마트",
                ),
                AddItemRow(
                  controller: _dateController,
                  label: "언제 장을 보실건가요?",
                  readOnly: true,
                  style: context.subtitle1,
                  onTap: () => _showDatePicker(context),
                ),
                AddItemRow(
                  controller: _categoryController,
                  label: "어떤 종류의 장보기인가요?",
                  readOnly: true,
                  style: context.subtitle1,
                  showSuffix: true,
                  onTap: () => _showCategory(context),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: LoadingPageBottomButton.ctaWithDivider(
        btnText: L.current.Add,
        onPressed: ref.watch(isNewCartCtaPossibleProvider)
            ? () async {
                final db2.CartsCompanion c = db2.CartsCompanion.insert(
                  title: _titleController.text,
                  category: _categoryController.text,
                  date: DateFormat(formatString).parse(_dateController.text),
                );

                ref.read(newCartProvider.notifier).setState(c);
                await ref.read(newCartProvider.notifier).add();
                ref
                    .read(cartListProvider.notifier)
                    .refresh()
                    .then((value) => context.pop());
              }
            : null,
      ),
    );
  }
}

enum TempCategory {
  food,
  clothes,
  etc;

  String get name {
    switch (this) {
      case TempCategory.food:
        return "식료품";
      case TempCategory.clothes:
        return "의류";
      case TempCategory.etc:
        return "기타";
    }
  }

  Color get color {
    switch (this) {
      case TempCategory.food:
        return EasyCartColorMap().primary;
      case TempCategory.clothes:
        return EasyCartColorMap().label.contents;
      case TempCategory.etc:
        return EasyCartColorMap().revenue.minus;
    }
  }
}
