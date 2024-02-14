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
class DoneListPage extends ConsumerWidget {
  DoneListPage({super.key});

  final interstitialAd = GoogleAds();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...ref.watch(doneListProvider).map(
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
        ],
      ),
    );
  }
}
