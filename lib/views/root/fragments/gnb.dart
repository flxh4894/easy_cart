import 'package:easy_cart/src/common/model/enum/content_root.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
/// GNB
///
class Gnb extends StatelessWidget {
  const Gnb({
    super.key,
    required TabController tabController,
    required this.tab,
  }) : _tabController = tabController;

  final TabController _tabController;
  final List<GnbTab> tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: EasyCartColorMap().gray.shade200,
          ),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateColor.resolveWith(
          (states) => Colors.transparent,
        ),
        indicatorColor: Colors.transparent,
        labelColor: EasyCartColorMap().gray.shade500,
        unselectedLabelColor: EasyCartColorMap().gray.shade300,
        labelStyle: context.subtitle4,
        labelPadding: EdgeInsets.zero,
        onTap: (value) {
          final idx = tab[value];
          context.go(idx.route);
        },
        tabs: tab
            .map((e) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    e.icon,
                    Text(e.name),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
