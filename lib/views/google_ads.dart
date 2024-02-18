// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// ///
// /// 배너 광고 위젯
// ///
// class BannerAds extends ConsumerStatefulWidget {
//   const BannerAds({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _BannerAdsState();
// }

// class _BannerAdsState extends ConsumerState<BannerAds> {
//   BannerAd? _anchoredAdaptiveAd;
//   bool _isLoaded = false;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _loadAd();
//   }

//   Future<void> _loadAd() async {
//     // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
//     final AnchoredAdaptiveBannerAdSize? size =
//         await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
//             MediaQuery.of(context).size.width.truncate());

//     if (size == null) {
//       log('Unable to get height of anchored banner.');
//       return;
//     }

//     _anchoredAdaptiveAd = BannerAd(
//       adUnitId: Platform.isAndroid
//           ? 'ca-app-pub-3940256099942544/6300978111'
//           : 'ca-app-pub-3940256099942544/2934735716',
//       size: size,
//       request: const AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (Ad ad) {
//           log('$ad loaded: ${ad.responseInfo}');
//           setState(() {
//             // When the ad is loaded, get the ad size and use it to set
//             // the height of the ad container.
//             _anchoredAdaptiveAd = ad as BannerAd;
//             _isLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           log('Anchored adaptive banner failedToLoad: $error');
//           ad.dispose();
//         },
//       ),
//     );
//     return _anchoredAdaptiveAd!.load();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _anchoredAdaptiveAd != null && _isLoaded
//         ? Container(
//             color: Colors.transparent,
//             width: _anchoredAdaptiveAd!.size.width.toDouble(),
//             height: _anchoredAdaptiveAd!.size.height.toDouble(),
//             child: AdWidget(ad: _anchoredAdaptiveAd!),
//           )
//         : const Offstage();
//   }
// }

// ///
// /// 전면 광고 클래스 (호출 형식임)
// ///
// class GoogleAds {
//   GoogleAds() {
//     _loadInterstitialAd();
//   }

//   late InterstitialAd _interstitialAd;

//   void _loadInterstitialAd() {
//     log("_loadInterstitialAd init");
//     InterstitialAd.load(
//       adUnitId: 'ca-app-pub-3940256099942544/1033173712',
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           _interstitialAd = ad;
//         },
//         onAdFailedToLoad: (error) {
//           log('Failed to load interstitial ad: $error');
//         },
//       ),
//     );
//   }

//   void showInterstitialAd({required Function onPressedCloseBtn}) {
//     _interstitialAd.show();
//     _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (InterstitialAd ad) =>
//           log('%ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         log('$ad onAdDismissedFullScreenContent.');
//         onPressedCloseBtn();
//         _loadInterstitialAd();
//         ad.dispose();
//       },
//       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//         log('$ad onAdFailedToShowFullScreenContent: $error');
//         _loadInterstitialAd();
//         ad.dispose();
//       },
//       onAdImpression: (InterstitialAd ad) => log('$ad impression occurred.'),
//     );
//   }
// }
