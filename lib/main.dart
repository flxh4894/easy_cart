import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/injection/main.dart';
import 'package:easy_cart/model/store_detail_model.dart';
import 'package:easy_cart/model/store_model.dart';
import 'package:easy_cart/routes/new_routes.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String googleAdsBox = "googleAdsCount";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingInjection.ensureInitialized();

  await Hive.initFlutter();
  MobileAds.instance.initialize();

  Hive.registerAdapter<StoreModel>(store());
  await Hive.openBox<StoreModel>(storeModelName);
  Hive.registerAdapter<StoreDetailModel>(storeDetail());
  await Hive.openBox<StoreDetailModel>(storeDetailModelName);
  Hive.registerAdapter<StoreDetailList>(storeDetailList());
  await Hive.openBox<StoreDetailList>(storeDetailListName);
  await Hive.openBox<int>(googleAdsBox);

  runApp(
    const ProviderScope(
      child: EasyCartApp(),
    ),
  );
}

class EasyCartApp extends StatelessWidget {
  const EasyCartApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Easy Cart',
      theme: easyCartTheme,
      locale: const Locale('ko', 'KR'),
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      localizationsDelegates: const [
        L.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: routes,
    );
  }
}
