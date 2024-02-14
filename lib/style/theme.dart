import 'package:easy_cart/gen/fonts.gen.dart';
import 'package:easy_cart/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get headline1 => textTheme.displayLarge;
  TextStyle? get headline2 => textTheme.displayMedium;
  TextStyle? get headline3 => textTheme.displaySmall;
  TextStyle? get headline4 => textTheme.headlineMedium;
  TextStyle? get headline5 => textTheme.headlineSmall;
  TextStyle? get headline6 => textTheme.titleLarge;
  TextStyle? get subtitle1 => textTheme.titleMedium;
  TextStyle? get subtitle2 => textTheme.titleSmall;
  TextStyle? get bodyText1 => textTheme.bodyLarge;
  TextStyle? get bodyText2 => textTheme.bodyMedium;
  TextStyle get subtitle4 => TextStyle(
        color: EasyCartColorMap().gray.shade900,
        fontFamilyFallback: const [FontFamily.pretendard],
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w600,
      );
  TextStyle get bodyLargeBold => TextStyle(
        color: EasyCartColorMap().gray.shade900,
        fontFamilyFallback: const [FontFamily.pretendard],
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        height: 24 / 16,
      );
  TextStyle get body2Bold => TextStyle(
        color: EasyCartColorMap().gray.shade900,
        fontFamilyFallback: const [FontFamily.pretendard],
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w700,
      );
  TextStyle get bodySmallBold => TextStyle(
        color: EasyCartColorMap().gray.shade900,
        fontFamilyFallback: const [FontFamily.pretendard],
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w700,
      );
}

final easyCartTheme = ThemeData(
  primarySwatch: const MaterialColor(
    0xFFFE4864,
    <int, Color>{
      50: Color(0xFFFCE4EC),
      100: Color(0xFFF8BBD0),
      200: Color(0xFFF48FB1),
      300: Color(0xFFF06292),
      400: Color(0xFFEC407A),
      500: Color(0xFFFE4864),
      600: Color(0xFFD81B60),
      700: Color(0xFFC2185B),
      800: Color(0xFFAD1457),
      900: Color(0xFF880E4F),
    },
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: EasyCartColorMap().gray.shade900,
      fontFamilyFallback: const [FontFamily.pretendard],
      fontSize: 24.0,
      height: 28 / 24,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: EasyCartColorMap().gray.shade900,
      fontFamilyFallback: const [FontFamily.pretendard],
      fontSize: 20.0,
      height: 28 / 20,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      color: EasyCartColorMap().gray.shade900,
      fontFamilyFallback: const [FontFamily.pretendard],
      fontSize: 18.0,
      height: 20 / 18,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: EasyCartColorMap().gray.shade900,
      fontFamilyFallback: const [FontFamily.pretendard],
      fontSize: 16.0,
      height: 20 / 16,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: EasyCartColorMap().gray.shade900,
      fontFamilyFallback: const [FontFamily.pretendard],
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      height: 20 / 18,
    ),
    titleSmall: TextStyle(
      color: EasyCartColorMap().gray.shade900,
      fontFamilyFallback: const [FontFamily.pretendard],
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      height: 24 / 16,
    ),
    bodyLarge: TextStyle(
      color: EasyCartColorMap().gray.shade900,
      fontFamilyFallback: const [FontFamily.pretendard],
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      height: 24 / 16,
    ),
    bodyMedium: TextStyle(
      color: EasyCartColorMap().gray.shade900,
      fontFamilyFallback: const [FontFamily.pretendard],
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      height: 16 / 12,
    ),
  ),
);
