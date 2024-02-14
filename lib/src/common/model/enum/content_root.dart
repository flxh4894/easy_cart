import 'package:easy_cart/routes/new_routes.dart';
import 'package:flutter/material.dart';

enum GnbTab {
  cart,
  done,
}

extension GnbTabExtension on GnbTab {
  String get name {
    switch (this) {
      case GnbTab.cart:
        return "Cart";
      case GnbTab.done:
        return "Done";
    }
  }

  Widget get icon {
    switch (this) {
      case GnbTab.cart:
        return const Icon(Icons.shopping_cart);
      case GnbTab.done:
        return const Icon(Icons.download_done);
    }
  }

  String get route {
    switch (this) {
      case GnbTab.cart:
        return EcRoute.cart.path;
      case GnbTab.done:
        return EcRoute.done.path;
    }
  }
}
