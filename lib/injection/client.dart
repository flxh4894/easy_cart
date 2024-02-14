import 'package:easy_cart/src/clients/drift.dart';
import 'package:get_it/get_it.dart';

abstract class $ClientInejction {
  static inject(GetIt instance) {}
}

class ClientInejction extends $ClientInejction {
  static inject(GetIt instance) {
    instance.registerLazySingleton<AppDatabase>(() => AppDatabase());
  }
}
