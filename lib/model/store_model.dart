// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// part 'store_model.freezed.dart';
// part 'store_model.g.dart';

// // DB 이름
// const storeModelName = 'store';

// @freezed
// class StoreModel extends HiveObject with _$StoreModel {
//   StoreModel._();

//   @HiveType(typeId: 1, adapterName: storeModelName)
//   factory StoreModel({
//     @HiveField(0) required String title,
//     @HiveField(1) @Default("") String childKey,
//     @HiveField(2) @Default(false) bool isDone,
//     @HiveField(3) @Default("") String doneAt,
//     @HiveField(4) @Default(0) int doneCnt,
//     @HiveField(5) @Default(0) int totalCnt,
//   }) = _StoreModel;

//   factory StoreModel.fromJson(json) => _$StoreModelFromJson(json);
// }
