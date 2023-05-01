import 'package:easy_cart/components/scaffold.dart';
import 'package:easy_cart/provider/home_provider.dart';
import 'package:easy_cart/style/color.dart';
import 'package:easy_cart/views/gnb/done_list.dart';
import 'package:easy_cart/views/gnb/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'root.g.dart';

///
/// 컨텐츠 루트 페이지
///
class RootContentPage extends ConsumerWidget {
  RootContentPage({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idx = ref.watch(rootIndexProvider);
    ref.watch(homeProvider);
    return EasyCartScaffold(
      body: PageView(
        controller: _controller,
        children: ref.read(rootIndexProvider.notifier).rootContent,
        onPageChanged: (value) {
          ref.read(rootIndexProvider.notifier).changeIndex(value);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: EasyCartColorMap().gray.shade500,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: '장바구니'),
          BottomNavigationBarItem(
              icon: Icon(Icons.download_done), label: '완료목록'),
        ],
        currentIndex: idx,
        onTap: (idx) {
          ref.read(rootIndexProvider.notifier).changeIndex(idx);
          _controller.jumpToPage(idx);
        },
      ),
    );
  }
}

@riverpod
class RootIndex extends _$RootIndex {
  final List<Widget> rootContent = [
    const HomePage(),
    const DoneListPage(),
  ];

  @override
  int build() {
    return 0;
  }

  void changeIndex(int idx) {
    state = idx;
  }
}
