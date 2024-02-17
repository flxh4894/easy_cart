// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:easy_cart/components/button/new_loading_page_button.dart';
import 'package:easy_cart/components/scaffold/scaffold.dart';
import 'package:easy_cart/components/title_panel.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:easy_cart/views/new_cart/fragments/date_picker.dart';
import 'package:easy_cart/views/new_cart/fragments/item_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

///
/// 새로운 장바구니 추가 페이지
///
class AddNewCartPage extends ConsumerWidget {
  AddNewCartPage({
    super.key,
  });

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _dateController = TextEditingController(
    text: DateFormat('yyyy-MM-dd (E)').format(DateTime.now()),
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  onTap: () => _showDatePicker(context),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: LoadingPageBottomButton.ctaWithDivider(
        btnText: L.current.Add,
        onPressed: () async {},
      ),
    );
  }
}
