import 'package:easy_cart/components/row/row.dart';
import 'package:easy_cart/detail.dart';
import 'package:easy_cart/provider/google_ads_provider.dart';
import 'package:easy_cart/provider/home_provider.dart';
import 'package:easy_cart/routes/routes.dart';
import 'package:easy_cart/views/google_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
/// Home Page
///
class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final interstitialAd = GoogleAds();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ReorderableListView(
            onReorder: (oldIndex, newIndex) {
              // reorder index 때문에 해당 조건 태워야함.
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }

              // 실제 homeprovider에 있는 인덱스 값을 잡아야 함.
              final oldModel = ref.read(storeListProvider)[oldIndex];
              final newModel = ref.read(storeListProvider)[newIndex];

              oldIndex = ref.read(homeProvider).indexOf(oldModel);
              newIndex = ref.read(homeProvider).indexOf(newModel);

              ref.read(homeProvider.notifier).onReorder(oldIndex, newIndex);
            },
            children: ref.watch(storeListProvider).map(
              (storeModel) {
                final int idx = ref.read(homeProvider).indexOf(storeModel);
                return GestureDetector(
                  key: Key(storeModel.toString()),
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    await ref.read(googleAdsCountProvider.notifier).isShowAds()
                        ? interstitialAd.showInterstitialAd(
                            onPressedCloseBtn: () {
                            Navigator.pushNamed(
                              context,
                              RouteEnum.detail.path,
                              arguments:
                                  StoreDetailArg(model: storeModel, index: idx),
                            );
                          })
                        : Navigator.pushNamed(
                            context,
                            RouteEnum.detail.path,
                            arguments:
                                StoreDetailArg(model: storeModel, index: idx),
                          );
                    ref.read(googleAdsCountProvider.notifier).updateCount();
                  },
                  child: EasyRow(
                    storeModel: storeModel,
                    idx: idx,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
