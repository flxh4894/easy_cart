import 'package:easy_cart/src/clients/drift.dart';
import 'package:easy_cart/util/logger.dart';
import 'package:get_it/get_it.dart';

abstract class $KeywordRepository {
  Future<void> add(KeywordsCompanion entity);
  Future<List<Keyword>> get({int? limit});
}

class KeywordRepository extends $KeywordRepository {
  final db = GetIt.instance.get<AppDatabase>();

  @override
  Future<void> add(KeywordsCompanion entity) async {
    try {
      await db.into(db.keywords).insert(entity);
    } catch (e) {
      logger.e(e.toString());
    }
  }

  @override
  Future<List<Keyword>> get({int? limit}) async {
    const q = """
          SELECT 
            id, 
            keyword, 
            is_favorite, 
            MAX(date) AS latest_date  
          FROM 
            keywords 
          GROUP BY 
            keyword 
          ORDER BY 
            latest_date DESC
        """;
    final list = await db.customSelect(
      q + (limit != null ? ' LIMIT $limit' : ''),
      readsFrom: {db.keywords},
    ).get();

    return list
        .map(
          (e) => Keyword(
            id: e.read<int>('id'),
            keyword: e.read<String>('keyword'),
            isFavorite: e.read<bool>('is_favorite'),
            date: e.read<DateTime>('latest_date'),
          ),
        )
        .toList();
  }
}
