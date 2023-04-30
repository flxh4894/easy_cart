// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreDetailModel _$StoreDetailModelFromJson(Map<String, dynamic> json) {
  return _StoreDetailModel.fromJson(json);
}

/// @nodoc
mixin _$StoreDetailModel {
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isDone => throw _privateConstructorUsedError;
  @HiveField(4)
  String get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreDetailModelCopyWith<StoreDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDetailModelCopyWith<$Res> {
  factory $StoreDetailModelCopyWith(
          StoreDetailModel value, $Res Function(StoreDetailModel) then) =
      _$StoreDetailModelCopyWithImpl<$Res, StoreDetailModel>;
  @useResult
  $Res call(
      {@HiveField(1) String title,
      @HiveField(2) int quantity,
      @HiveField(3) bool isDone,
      @HiveField(4) String hash});
}

/// @nodoc
class _$StoreDetailModelCopyWithImpl<$Res, $Val extends StoreDetailModel>
    implements $StoreDetailModelCopyWith<$Res> {
  _$StoreDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? quantity = null,
    Object? isDone = null,
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreDetailModelCopyWith<$Res>
    implements $StoreDetailModelCopyWith<$Res> {
  factory _$$_StoreDetailModelCopyWith(
          _$_StoreDetailModel value, $Res Function(_$_StoreDetailModel) then) =
      __$$_StoreDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String title,
      @HiveField(2) int quantity,
      @HiveField(3) bool isDone,
      @HiveField(4) String hash});
}

/// @nodoc
class __$$_StoreDetailModelCopyWithImpl<$Res>
    extends _$StoreDetailModelCopyWithImpl<$Res, _$_StoreDetailModel>
    implements _$$_StoreDetailModelCopyWith<$Res> {
  __$$_StoreDetailModelCopyWithImpl(
      _$_StoreDetailModel _value, $Res Function(_$_StoreDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? quantity = null,
    Object? isDone = null,
    Object? hash = null,
  }) {
    return _then(_$_StoreDetailModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: storeDetailModelName)
class _$_StoreDetailModel extends _StoreDetailModel {
  _$_StoreDetailModel(
      {@HiveField(1) required this.title,
      @HiveField(2) this.quantity = 0,
      @HiveField(3) this.isDone = false,
      @HiveField(4) this.hash = ""})
      : super._();

  factory _$_StoreDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoreDetailModelFromJson(json);

  @override
  @HiveField(1)
  final String title;
  @override
  @JsonKey()
  @HiveField(2)
  final int quantity;
  @override
  @JsonKey()
  @HiveField(3)
  final bool isDone;
  @override
  @JsonKey()
  @HiveField(4)
  final String hash;

  @override
  String toString() {
    return 'StoreDetailModel(title: $title, quantity: $quantity, isDone: $isDone, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreDetailModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, quantity, isDone, hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreDetailModelCopyWith<_$_StoreDetailModel> get copyWith =>
      __$$_StoreDetailModelCopyWithImpl<_$_StoreDetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreDetailModelToJson(
      this,
    );
  }
}

abstract class _StoreDetailModel extends StoreDetailModel {
  factory _StoreDetailModel(
      {@HiveField(1) required final String title,
      @HiveField(2) final int quantity,
      @HiveField(3) final bool isDone,
      @HiveField(4) final String hash}) = _$_StoreDetailModel;
  _StoreDetailModel._() : super._();

  factory _StoreDetailModel.fromJson(Map<String, dynamic> json) =
      _$_StoreDetailModel.fromJson;

  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  int get quantity;
  @override
  @HiveField(3)
  bool get isDone;
  @override
  @HiveField(4)
  String get hash;
  @override
  @JsonKey(ignore: true)
  _$$_StoreDetailModelCopyWith<_$_StoreDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreDetailList _$StoreDetailListFromJson(Map<String, dynamic> json) {
  return _StoreDetailList.fromJson(json);
}

/// @nodoc
mixin _$StoreDetailList {
  @HiveField(0)
  List<StoreDetailModel> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreDetailListCopyWith<StoreDetailList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDetailListCopyWith<$Res> {
  factory $StoreDetailListCopyWith(
          StoreDetailList value, $Res Function(StoreDetailList) then) =
      _$StoreDetailListCopyWithImpl<$Res, StoreDetailList>;
  @useResult
  $Res call({@HiveField(0) List<StoreDetailModel> list});
}

/// @nodoc
class _$StoreDetailListCopyWithImpl<$Res, $Val extends StoreDetailList>
    implements $StoreDetailListCopyWith<$Res> {
  _$StoreDetailListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<StoreDetailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreDetailListCopyWith<$Res>
    implements $StoreDetailListCopyWith<$Res> {
  factory _$$_StoreDetailListCopyWith(
          _$_StoreDetailList value, $Res Function(_$_StoreDetailList) then) =
      __$$_StoreDetailListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) List<StoreDetailModel> list});
}

/// @nodoc
class __$$_StoreDetailListCopyWithImpl<$Res>
    extends _$StoreDetailListCopyWithImpl<$Res, _$_StoreDetailList>
    implements _$$_StoreDetailListCopyWith<$Res> {
  __$$_StoreDetailListCopyWithImpl(
      _$_StoreDetailList _value, $Res Function(_$_StoreDetailList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_StoreDetailList(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<StoreDetailModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3, adapterName: storeDetailListName)
class _$_StoreDetailList extends _StoreDetailList {
  _$_StoreDetailList(
      {@HiveField(0) final List<StoreDetailModel> list = const []})
      : _list = list,
        super._();

  factory _$_StoreDetailList.fromJson(Map<String, dynamic> json) =>
      _$$_StoreDetailListFromJson(json);

  final List<StoreDetailModel> _list;
  @override
  @JsonKey()
  @HiveField(0)
  List<StoreDetailModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'StoreDetailList(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreDetailList &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreDetailListCopyWith<_$_StoreDetailList> get copyWith =>
      __$$_StoreDetailListCopyWithImpl<_$_StoreDetailList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreDetailListToJson(
      this,
    );
  }
}

abstract class _StoreDetailList extends StoreDetailList {
  factory _StoreDetailList({@HiveField(0) final List<StoreDetailModel> list}) =
      _$_StoreDetailList;
  _StoreDetailList._() : super._();

  factory _StoreDetailList.fromJson(Map<String, dynamic> json) =
      _$_StoreDetailList.fromJson;

  @override
  @HiveField(0)
  List<StoreDetailModel> get list;
  @override
  @JsonKey(ignore: true)
  _$$_StoreDetailListCopyWith<_$_StoreDetailList> get copyWith =>
      throw _privateConstructorUsedError;
}
