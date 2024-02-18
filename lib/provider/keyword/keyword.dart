import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/src/keyword/use_case.dart';
import 'package:easy_cart/util/logger.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keyword.g.dart';

@riverpod
class RecentKeyword extends _$RecentKeyword {
  final uc = GetIt.I.get<KeywordUseCase>();

  @override
  FutureOr<List<Keyword>> build() async {
    logger.d('RecentKeyword build');
    return await uc.get(limit: 10);
  }
}
