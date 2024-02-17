import 'package:easy_cart/components/button/new_loading_page_button.dart';
import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/style/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DatePickerBottomSheet extends StatelessWidget {
  DatePickerBottomSheet({
    required this.onDateTimeChanged,
    super.key,
  });

  final Function(String date) onDateTimeChanged;
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: EasyCartColorMap().surfaceColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(top: 6.0),
      // The Bottom margin is provided to align the popup above the system
      // navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.

      // Use a SafeArea widget to avoid system overlaps.
      child: Column(
        children: [
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                _dateController.text =
                    DateFormat('yyyy-MM-dd (E)').format(value);
              },
            ),
          ),
          const SizedBox(height: 8),
          LoadingPageBottomButton.ctaWithDivider(
            btnText: L.current.Confirm,
            onPressed: () async {
              onDateTimeChanged(_dateController.text);
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
