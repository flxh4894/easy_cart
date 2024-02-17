import 'package:easy_cart/injection/client.dart';
import 'package:easy_cart/routes/transition.dart';
import 'package:easy_cart/src/common/model/common.dart';
import 'package:easy_cart/views/new_cart/main.dart';
import 'package:easy_cart/views/root/cart.dart';
import 'package:easy_cart/views/root/done.dart';
import 'package:easy_cart/views/root/main.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final _key = GetIt.I.get<NavigatorKey>(instanceName: navigationKey);
final routes = GoRouter(
  navigatorKey: _key,
  initialLocation: EcRoute.cart.path,
  routes: [
    // GNB
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _key,
      branches: [
        StatefulShellBranch(
          routes: [
            goRouteNoTransition(
              path: EcRoute.cart.path,
              name: EcRoute.cart.name,
              pageBuilder: (context, state) {
                return const CartMainPage();
              },
            ),
            goRouteNoTransition(
              path: EcRoute.done.path,
              name: EcRoute.done.name,
              pageBuilder: (context, state) {
                return const DoneMainPage();
              },
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return ContentRoot(
          state: state,
          body: navigationShell,
        );
      },
    ),
    goRouteSlideRight(
      path: EcRoute.createCart.path,
      name: EcRoute.createCart.name,
      pageBuilder: (context, state) {
        return AddNewCartPage();
      },
    ),
  ],
);

enum EcRouteGroup {
  splash,
  root;

  String get path => '/$name';
}

enum EcRoute {
  cart,
  done,
  createCart;

  String get group {
    switch (this) {
      default:
        return EcRouteGroup.root.name;
    }
  }

  String get path {
    return (group == EcRouteGroup.root.name) ? '/$name' : '/$group/$name';
  }
}
