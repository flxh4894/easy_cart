// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _StoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @HiveField(1)
  String get childKey => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get isDone => throw _privateConstructorUsedError;
  @HiveField(3)
  String get doneAt => throw _privateConstructorUsedError;
  @HiveField(4)
  int get doneCnt => throw _privateConstructorUsedError;
  @HiveField(5)
  int get totalCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res, StoreModel>;
  @useResult
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) String childKey,
      @HiveField(2) bool isDone,
      @HiveField(3) String doneAt,
      @HiveField(4) int doneCnt,
      @HiveField(5) int totalCnt});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res, $Val extends StoreModel>
    implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? childKey = null,
    Object? isDone = null,
    Object? doneAt = null,
    Object? doneCnt = null,
    Object? totalCnt = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      childKey: null == childKey
          ? _value.childKey
          : childKey // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      doneAt: null == doneAt
          ? _value.doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as String,
      doneCnt: null == doneCnt
          ? _value.doneCnt
          : doneCnt // ignore: cast_nullable_to_non_nullable
              as int,
      totalCnt: null == totalCnt
          ? _value.totalCnt
          : totalCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreModelCopyWith<$Res>
    implements $StoreModelCopyWith<$Res> {
  factory _$$_StoreModelCopyWith(
          _$_StoreModel value, $Res Function(_$_StoreModel) then) =
      __$$_StoreModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) String childKey,
      @HiveField(2) bool isDone,
      @HiveField(3) String doneAt,
      @HiveField(4) int doneCnt,
      @HiveField(5) int totalCnt});
}

/// @nodoc
class __$$_StoreModelCopyWithImpl<$Res>
    extends _$StoreModelCopyWithImpl<$Res, _$_StoreModel>
    implements _$$_StoreModelCopyWith<$Res> {
  __$$_StoreModelCopyWithImpl(
      _$_StoreModel _value, $Res Function(_$_StoreModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? childKey = null,
    Object? isDone = null,
    Object? doneAt = null,
    Object? doneCnt = null,
    Object? totalCnt = null,
  }) {
    return _then(_$_StoreModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      childKey: null == childKey
          ? _value.childKey
          : childKey // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      doneAt: null == doneAt
          ? _value.doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as String,
      doneCnt: null == doneCnt
          ? _value.doneCnt
          : doneCnt // ignore: cast_nullable_to_non_nullable
              as int,
      totalCnt: null == totalCnt
          ? _value.totalCnt
          : totalCnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: storeModelName)
class _$_StoreModel extends _StoreModel {
  _$_StoreModel(
      {@HiveField(0) required this.title,
      @HiveField(1) this.childKey = "",
      @HiveField(2) this.isDone = false,
      @HiveField(3) this.doneAt = "",
      @HiveField(4) this.doneCnt = 0,
      @HiveField(5) this.totalCnt = 0})
      : super._();

  factory _$_StoreModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoreModelFromJson(json);

  @override
  @HiveField(0)
  final String title;
  @override
  @JsonKey()
  @HiveField(1)
  final String childKey;
  @override
  @JsonKey()
  @HiveField(2)
  final bool isDone;
  @override
  @JsonKey()
  @HiveField(3)
  final String doneAt;
  @override
  @JsonKey()
  @HiveField(4)
  final int doneCnt;
  @override
  @JsonKey()
  @HiveField(5)
  final int totalCnt;

  @override
  String toString() {
    return 'StoreModel(title: $title, childKey: $childKey, isDone: $isDone, doneAt: $doneAt, doneCnt: $doneCnt, totalCnt: $totalCnt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.childKey, childKey) ||
                other.childKey == childKey) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.doneAt, doneAt) || other.doneAt == doneAt) &&
            (identical(other.doneCnt, doneCnt) || other.doneCnt == doneCnt) &&
            (identical(other.totalCnt, totalCnt) ||
                other.totalCnt == totalCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, childKey, isDone, doneAt, doneCnt, totalCnt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreModelCopyWith<_$_StoreModel> get copyWith =>
      __$$_StoreModelCopyWithImpl<_$_StoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreModelToJson(
      this,
    );
  }
}

abstract class _StoreModel extends StoreModel {
  factory _StoreModel(
      {@HiveField(0) required final String title,
      @HiveField(1) final String childKey,
      @HiveField(2) final bool isDone,
      @HiveField(3) final String doneAt,
      @HiveField(4) final int doneCnt,
      @HiveField(5) final int totalCnt}) = _$_StoreModel;
  _StoreModel._() : super._();

  factory _StoreModel.fromJson(Map<String, dynamic> json) =
      _$_StoreModel.fromJson;

  @override
  @HiveField(0)
  String get title;
  @override
  @HiveField(1)
  String get childKey;
  @override
  @HiveField(2)
  bool get isDone;
  @override
  @HiveField(3)
  String get doneAt;
  @override
  @HiveField(4)
  int get doneCnt;
  @override
  @HiveField(5)
  int get totalCnt;
  @override
  @JsonKey(ignore: true)
  _$$_StoreModelCopyWith<_$_StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
