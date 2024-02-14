import 'package:easy_cart/src/clients/drift.dart';
import 'package:get_it/get_it.dart';

abstract class $CartRepository {
  Future<void> add(int a);
  Future<List<TodoItem>> getAll();
  Future<TodoItem> get();
  Future<void> removeAll();
}

class CartRepository extends $CartRepository {
  final db = GetIt.instance.get<AppDatabase>();

  @override
  Future<void> add(int a) async {
    await db.into(db.todoItems).insert(
          TodoItemsCompanion.insert(
              title: 'title :: Test4', content: 'Test Data'),
        );
  }

  @override
  Future<List<TodoItem>> getAll() async {
    return await db.select(db.todoItems).get()
      ..where((element) => element.title == "title :: Test3");
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
