import 'package:easy_cart/src/cart/repository/repository.dart';
import 'package:get_it/get_it.dart';

abstract class $RepositoryInejction {
  static inject(GetIt instance) {}
}

class RepositoryInejction extends $RepositoryInejction {
  static inject(GetIt instance) {
    instance.registerFactory<$CartRepository>(() => CartRepository());
  }
}
