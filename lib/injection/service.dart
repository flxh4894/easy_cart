import 'package:easy_cart/src/cart/service.dart';
import 'package:easy_cart/src/keyword/service.dart';
import 'package:get_it/get_it.dart';

abstract class $ServiceInjection {
  static inject(GetIt instance) {}
}

class ServiceInjection extends $ServiceInjection {
  static inject(GetIt i) {
    i.registerLazySingleton<CartService>(() => CartService());
    i.registerLazySingleton<KeywordService>(() => KeywordService());
  }
}
