import 'package:easy_cart/src/cart/use_case.dart';
import 'package:easy_cart/src/keyword/use_case.dart';
import 'package:get_it/get_it.dart';

abstract class $UseCaseInjection {
  static inject(GetIt instance) {}
}

class UseCaseInjection extends $UseCaseInjection {
  static inject(GetIt i) {
    i.registerLazySingleton<CartUseCase>(() => CartUseCase());
    i.registerLazySingleton<KeywordUseCase>(() => KeywordUseCase());
  }
}
