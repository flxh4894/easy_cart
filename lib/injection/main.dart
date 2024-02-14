import 'package:easy_cart/injection/client.dart';
import 'package:easy_cart/injection/repository.dart';
import 'package:easy_cart/injection/service.dart';
import 'package:easy_cart/injection/use_case.dart';
import 'package:get_it/get_it.dart';

class SettingInjection {
  static Future<void> ensureInitialized() async {
    final GetIt instance = GetIt.instance;

    ClientInejction.inject(instance);
    RepositoryInejction.inject(instance);
    ServiceInjection.inject(instance);
    UseCaseInjection.inject(instance);

    await instance.allReady();
  }
}
