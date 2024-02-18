import 'package:drift/drift.dart';
import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/src/keyword/service.dart';
import 'package:easy_cart/util/logger.dart';
import 'package:get_it/get_it.dart';

class KeywordUseCase {
  final service = GetIt.I.get<KeywordService>();

  Future<void> add(String keyword) async {
    final repo = service.repo;
    await repo.add(
      KeywordsCompanion.insert(
        keyword: keyword,
        date: Value(DateTime.now()),
      ),
    );
  }

  Future<List<Keyword>> get({int? limit}) async {
    try {
      final repo = service.repo;
      return await repo.get(limit: limit);
    } catch (e) {
      logger.e(e.toString());
      return [];
    }
  }
}
