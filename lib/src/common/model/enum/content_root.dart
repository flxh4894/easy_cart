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
        return "장바구니";
      case GnbTab.done:
        return "완료목록";
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
