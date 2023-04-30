// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class store extends TypeAdapter<_$_StoreModel> {
  @override
  final int typeId = 1;

  @override
  _$_StoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_StoreModel(
      title: fields[0] as String,
      childKey: fields[1] as String,
      isDone: fields[2] as bool,
      doneAt: fields[3] as String,
      doneCnt: fields[4] as int,
      totalCnt: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_StoreModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.childKey)
      ..writeByte(2)
      ..write(obj.isDone)
      ..writeByte(3)
      ..write(obj.doneAt)
      ..writeByte(4)
      ..write(obj.doneCnt)
      ..writeByte(5)
      ..write(obj.totalCnt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is store &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoreModel _$$_StoreModelFromJson(Map<String, dynamic> json) =>
    _$_StoreModel(
      title: json['title'] as String,
      childKey: json['childKey'] as String? ?? "",
      isDone: json['isDone'] as bool? ?? false,
      doneAt: json['doneAt'] as String? ?? "",
      doneCnt: json['doneCnt'] as int? ?? 0,
      totalCnt: json['totalCnt'] as int? ?? 0,
    );

Map<String, dynamic> _$$_StoreModelToJson(_$_StoreModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'childKey': instance.childKey,
      'isDone': instance.isDone,
      'doneAt': instance.doneAt,
      'doneCnt': instance.doneCnt,
      'totalCnt': instance.totalCnt,
    };
