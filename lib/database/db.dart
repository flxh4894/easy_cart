import 'package:drift/drift.dart';

class Carts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2, max: 32)();
  TextColumn get category => text()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  IntColumn get currentCnt => integer().withDefault(const Constant(0))();
  IntColumn get totalCnt => integer().withDefault(const Constant(0))();
}

class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cartId => integer()();
  TextColumn get title => text().withLength(min: 1, max: 32)();
  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
}
