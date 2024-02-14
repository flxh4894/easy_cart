import 'dart:io';

import 'package:easy_cart/detail.dart';
import 'package:easy_cart/views/gnb/root.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum RouteEnum {
  contetRoot,
  detail,
}

extension RouteEnumExtension on RouteEnum {
  String get path {
    switch (this) {
      case RouteEnum.detail:
        return "/detail";
      case RouteEnum.contetRoot:
        return "/root";
    }
  }

  ValueKey<String> get _key => ValueKey<String>(name);

  RouteTransitionEnum get transition {
    switch (this) {
      default:
        return RouteTransitionEnum.slideRight;
    }
  }

  Widget page(settings) {
    switch (this) {
      case RouteEnum.contetRoot:
        return RootContentPage(
          key: _key,
        );
      case RouteEnum.detail:
        final StoreDetailArg args = settings.arguments as StoreDetailArg;
        return StoreDetailPage(
          model: args.model,
          stateIndex: args.index,
          key: _key,
        );
    }
  }

  Route packRoute(RouteSettings settings) {
    if (Platform.isAndroid) {
      return MaterialPageRoute(
        builder: (context) => page(settings),
      );
    } else if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (context) => page(settings),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => page(settings),
      );
    }
  }
}

extension RouteEnumParser on String? {
  RouteEnum get parse {
    if (this == null) {
      return RouteEnum.contetRoot;
    }
    return RouteEnum.values.firstWhere(
      (e) => this == e.path,
      orElse: () => RouteEnum.contetRoot,
    );
  }
}

enum RouteTransitionEnum { slideRight, fadeOut, noTransition }

extension RouteTransitionEnumExtension on RouteTransitionEnum {
  Route pack({
    required Widget page,
    required String name,
  }) {
    switch (this) {
      case RouteTransitionEnum.slideRight:
        return SlideRightRoute(page: page, name: name);
      case RouteTransitionEnum.fadeOut:
        return FadeOutRoute(page: page, name: name);
      case RouteTransitionEnum.noTransition:
        return NoTransitionRoute(page: page, name: name);
    }
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  final String name;
  SlideRightRoute({
    required this.page,
    required this.name,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            var begin = const Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          settings: RouteSettings(
            name: name,
          ),
        );
}

class FadeOutRoute extends PageRouteBuilder {
  final Widget page;
  final String name;
  FadeOutRoute({
    required this.page,
    required this.name,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          settings: RouteSettings(
            name: name,
          ),
        );
}

class NoTransitionRoute extends PageRouteBuilder {
  final Widget page;
  final String name;
  NoTransitionRoute({
    required this.page,
    required this.name,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          settings: RouteSettings(
            name: name,
          ),
        );
}

Route mainRoutes(RouteSettings settings) {
  RouteEnum route = RouteEnumParser(settings.name).parse;
  return route.packRoute(settings);
}
