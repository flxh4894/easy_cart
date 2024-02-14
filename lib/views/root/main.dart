import 'package:easy_cart/src/common/model/enum/content_root.dart';
import 'package:easy_cart/views/root/fragments/gnb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///
/// Root Page
///
class ContentRoot extends ConsumerStatefulWidget {
  const ContentRoot({
    super.key,
    required this.body,
    required this.state,
  });

  final Widget body;
  final GoRouterState state;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContentRootState();
}

class _ContentRootState extends ConsumerState<ContentRoot>
    with TickerProviderStateMixin {
  final tab = GnbTab.values;
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: tab.length,
      vsync: this,
      animationDuration: Duration.zero,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabController.length,
      child: Scaffold(
        body: widget.body,
        bottomNavigationBar: Gnb(
          tabController: _tabController,
          tab: tab,
        ),
      ),
    );
  }
}
