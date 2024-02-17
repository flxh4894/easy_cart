import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:easy_cart/database/db.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'drift.g.dart';

@DriftDatabase(tables: [
  Carts,
  CartItems,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3; // 이전 버전에서 1이었다면, 새 버전에서는 2로 증가

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll(); // 데이터베이스 생성 시 모든 테이블 생성
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 3) {
            await m.createTable(cartItems); // 'cartItems' 테이블 추가
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // // Make sqlite3 pick a more suitable location for temporary files - the
    // // one from the system may be inaccessible due to sandboxing.
    // final cachebase = (await getTemporaryDirectory()).path;
    // // We can't access /tmp on Android, which sqlite3 would try by default.
    // // Explicitly tell it about the correct temporary directory.
    // sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
