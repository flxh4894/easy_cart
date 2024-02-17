import 'package:easy_cart/src/clients/drift.dart';
import 'package:get_it/get_it.dart';

abstract class $CartRepository {
  Future<void> add(CartsCompanion entity);
  Future<List<Cart>> getAll();
  Future<TodoItem> get();
  Future<void> removeAll();
}

class CartRepository extends $CartRepository {
  final db = GetIt.instance.get<AppDatabase>();

  @override
  Future<void> add(CartsCompanion entity) async {
    await db.into(db.carts).insert(entity);
  }

  @override
  Future<List<Cart>> getAll() async {
    return await db.select(db.carts).get();
  }

  @override
  Future<TodoItem> get() async {
    return await (db.select(db.todoItems)
          ..where((tbl) => tbl.columnsByName['body']!.equals('title :: Test4')))
        .getSingle();
  }

  @override
  Future<void> removeAll() async {
    await db.delete(db.todoItems).go();
  }
}
