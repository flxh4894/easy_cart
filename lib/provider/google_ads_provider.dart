// import 'package:easy_cart/main.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'google_ads_provider.g.dart';

// ///
// /// Google Adsmob Provider
// ///
// @riverpod
// class GoogleAdsCount extends _$GoogleAdsCount {
//   final showCount = 5;

//   late Box<int> box;
//   @override
//   int build() {
//     box = Hive.box(googleAdsBox);

//     // 광고는 상세페이지 진입 5번 마다 실행
//     return box.get("count") ?? 0;
//   }

//   ///
//   /// 광고 노출 카운트에 도달 하였는가?
//   /// 0 부터 시작이라 showCount - 1
//   ///
//   Future<bool> isShowAds() async {
//     final result = (state == (showCount - 1));
//     return result;
//   }

//   ///
//   /// 광고 노출까지 카운트 업데이트
//   ///
//   Future<void> updateCount() async {
//     if (state == (showCount - 1)) {
//       await box.put("count", 0);
//       state = 0;
//     } else {
//       await box.put("count", state + 1);
//       state = state + 1;
//     }
//   }
// }
