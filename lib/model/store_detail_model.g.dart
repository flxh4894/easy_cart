// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class storeDetail extends TypeAdapter<_$_StoreDetailModel> {
  @override
  final int typeId = 2;

  @override
  _$_StoreDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_StoreDetailModel(
      title: fields[1] as String,
      quantity: fields[2] as int,
      isDone: fields[3] as bool,
      hash: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$_StoreDetailModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.isDone)
      ..writeByte(4)
      ..write(obj.hash);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is storeDetail &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class storeDetailList extends TypeAdapter<_$_StoreDetailList> {
  @override
  final int typeId = 3;

  @override
  _$_StoreDetailList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_StoreDetailList(
      list: (fields[0] as List).cast<StoreDetailModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_StoreDetailList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is storeDetailList &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreDetailModel _$$_StoreDetailModelFromJson(Map<String, dynamic> json) =>
    _$_StoreDetailModel(
      title: json['title'] as String,
      quantity: json['quantity'] as int? ?? 0,
      isDone: json['isDone'] as bool? ?? false,
      hash: json['hash'] as String? ?? "",
    );

Map<String, dynamic> _$$_StoreDetailModelToJson(_$_StoreDetailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'quantity': instance.quantity,
      'isDone': instance.isDone,
      'hash': instance.hash,
    };

_$_StoreDetailList _$$_StoreDetailListFromJson(Map<String, dynamic> json) =>
    _$_StoreDetailList(
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => StoreDetailModel.fromJson(e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_StoreDetailListToJson(_$_StoreDetailList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
