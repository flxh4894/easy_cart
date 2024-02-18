import 'package:easy_cart/generated/l10n.dart';
import 'package:easy_cart/injection/main.dart';

import 'package:easy_cart/routes/new_routes.dart';
import 'package:easy_cart/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const String googleAdsBox = "googleAdsCount";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SettingInjection.ensureInitialized();

  MobileAds.instance.initialize();

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
