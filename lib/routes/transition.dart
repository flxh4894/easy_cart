import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
/// Transitions
///
CustomTransitionPage<dynamic> _slideToRight(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 300),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

GoRoute goRouteSlideRight({
  required String path,
  required String name,
  Widget Function(BuildContext, GoRouterState)? pageBuilder,
  GoRouterRedirect? redirect,
  List<RouteBase>? routes,
}) {
  return GoRoute(
    path: path,
    name: name,
    redirect: redirect,
    pageBuilder: pageBuilder == null
        ? null
        : (context, state) => _slideToRight(
              state,
              pageBuilder(context, state),
            ),
    routes: routes ?? [],
  );
}

GoRoute goRouteNoTransition({
  required String path,
  required String name,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
  FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
  List<RouteBase>? routes,
}) {
  return GoRoute(
    path: path,
    name: name,
    redirect: redirect,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      child: pageBuilder(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    ),
    routes: routes ?? [],
  );
}
