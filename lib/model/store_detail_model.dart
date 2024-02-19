// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// part 'store_detail_model.freezed.dart';
// part 'store_detail_model.g.dart';

// // DB 이름
// const storeDetailModelName = 'storeDetail';

// @freezed
// class StoreDetailModel extends HiveObject with _$StoreDetailModel {
//   StoreDetailModel._();

//   @HiveType(typeId: 2, adapterName: storeDetailModelName)
//   factory StoreDetailModel({
//     @HiveField(1) required String title,
//     @HiveField(2) @Default(0) int quantity,
//     @HiveField(3) @Default(false) bool isDone,
//     @HiveField(4) @Default("") String hash,
//   }) = _StoreDetailModel;

//   factory StoreDetailModel.fromJson(json) => _$StoreDetailModelFromJson(json);
// }

// // DB 이름
// const storeDetailListName = 'storeDetailList';

// @freezed
// class StoreDetailList extends HiveObject with _$StoreDetailList {
//   StoreDetailList._();

//   @HiveType(typeId: 3, adapterName: storeDetailListName)
//   factory StoreDetailList({
//     @HiveField(0) @Default([]) List<StoreDetailModel> list,
//   }) = _StoreDetailList;

//   factory StoreDetailList.fromJson(json) => _$StoreDetailListFromJson(json);
// }
