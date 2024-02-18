import 'package:easy_cart/src/cart/repository/repository.dart';
import 'package:easy_cart/src/keyword/repository/repository.dart';
import 'package:get_it/get_it.dart';

abstract class $RepositoryInejction {
  static inject(GetIt instance) {}
}

class RepositoryInejction extends $RepositoryInejction {
  static inject(GetIt i) {
    i.registerLazySingleton<$CartRepository>(() => CartRepository());
    i.registerLazySingleton<$KeywordRepository>(() => KeywordRepository());
  }
}
