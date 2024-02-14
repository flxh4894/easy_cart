import 'package:easy_cart/src/cart/service.dart';
import 'package:get_it/get_it.dart';

abstract class $ServiceInjection {
  static inject(GetIt instance) {}
}

class ServiceInjection extends $ServiceInjection {
  static inject(GetIt instance) {
    instance.registerFactory<CartService>(() => CartService());
  }
}
