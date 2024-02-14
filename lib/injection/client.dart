import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/src/common/model/common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

const navigationKey = "NavigatorKey";
const shellNavigationKey = "ShellNavigatorKey";

abstract class $ClientInejction {
  static inject(GetIt instance) {}
}

class ClientInejction extends $ClientInejction {
  static inject(GetIt instance) {
    instance.registerSingleton<NavigatorKey>(
      GlobalKey<NavigatorState>(debugLabel: navigationKey),
      instanceName: navigationKey,
    );
    instance.registerSingleton<NavigatorKey>(
      GlobalKey<NavigatorState>(debugLabel: shellNavigationKey),
      instanceName: shellNavigationKey,
    );
    instance.registerLazySingleton<AppDatabase>(() => AppDatabase());
  }
}
