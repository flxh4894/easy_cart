import 'package:easy_cart/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

///
/// Banner ADS
///
class BannerAds extends ConsumerStatefulWidget {
  const BannerAds({
    super.key,
    required this.adUnitId,
  });

  final String adUnitId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BannerAdsState();
}

class _BannerAdsState extends ConsumerState<BannerAds> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          logger.e('BannerAd failed to load: $err');
          ad.dispose();
        },
        onAdOpened: (Ad ad) {},
        onAdClosed: (Ad ad) {},
        onAdImpression: (Ad ad) {},
      ),
    )..load();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoaded) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          child: SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          ),
        ),
      );
    } else {
      return const Offstage();
    }
  }
}
