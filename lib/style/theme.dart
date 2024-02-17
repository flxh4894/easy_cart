import 'package:easy_cart/gen/fonts.gen.dart';
import 'package:easy_cart/style/color.dart';
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

  TextStyle get label1 => TextStyle(
        color: EasyCartColorMap().gray.shade900,
        fontFamilyFallback: const [FontFamily.pretendard],
        fontSize: 16,
        height: 20 / 16,
        fontWeight: FontWeight.w700,
      );
  TextStyle get label2 => TextStyle(
        color: EasyCartColorMap().gray.shade900,
        fontFamilyFallback: const [FontFamily.pretendard],
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w700,
      );
  TextStyle get label3 => TextStyle(
        color: EasyCartColorMap().gray.shade900,
        fontFamilyFallback: const [FontFamily.pretendard],
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w700,
      );
  TextStyle get underline1 => TextStyle(
        color: EasyCartColorMap().gray.shade900,
        fontFamilyFallback: const [FontFamily.pretendard],
        fontSize: 14,
        height: 16 / 14,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w600,
      );
}

final easyCartTheme = ThemeData(
  primaryColor: EasyCartColorMap().primary,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: EasyCartColorMap().primary,
    onPrimary: EasyCartColorMap().white,
    secondary: EasyCartColorMap().white,
    onSecondary: EasyCartColorMap().primary,
    surface: EasyCartColorMap().surfaceColor,
    onSurface: EasyCartColorMap().gray,
    background: EasyCartColorMap().surfaceColor,
    onBackground: EasyCartColorMap().gray,
    error: EasyCartColorMap().system.error,
    onError: Colors.white,
  ),
  canvasColor: Colors.transparent,
  scaffoldBackgroundColor: EasyCartColorMap().surfaceColor,
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
