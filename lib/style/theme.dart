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
}
