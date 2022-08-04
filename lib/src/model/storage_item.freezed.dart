// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'storage_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StorageItem _$StorageItemFromJson(Map<String, dynamic> json) {
  return _StorageItem.fromJson(json);
}

/// @nodoc
mixin _$StorageItem {
  StorageItemType get type => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  List<StorageItem> get children => throw _privateConstructorUsedError;
  StorageItem? get parent => throw _privateConstructorUsedError;
  String? get downloadUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StorageItemCopyWith<StorageItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageItemCopyWith<$Res> {
  factory $StorageItemCopyWith(
          StorageItem value, $Res Function(StorageItem) then) =
      _$StorageItemCopyWithImpl<$Res>;
  $Res call(
      {StorageItemType type,
      String path,
      String name,
      int level,
      List<StorageItem> children,
      StorageItem? parent,
      String? downloadUrl});

  $StorageItemCopyWith<$Res>? get parent;
}

/// @nodoc
class _$StorageItemCopyWithImpl<$Res> implements $StorageItemCopyWith<$Res> {
  _$StorageItemCopyWithImpl(this._value, this._then);

  final StorageItem _value;
  // ignore: unused_field
  final $Res Function(StorageItem) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? path = freezed,
    Object? name = freezed,
    Object? level = freezed,
    Object? children = freezed,
    Object? parent = freezed,
    Object? downloadUrl = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StorageItemType,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      children: children == freezed
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<StorageItem>,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as StorageItem?,
      downloadUrl: downloadUrl == freezed
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $StorageItemCopyWith<$Res>? get parent {
    if (_value.parent == null) {
      return null;
    }

    return $StorageItemCopyWith<$Res>(_value.parent!, (value) {
      return _then(_value.copyWith(parent: value));
    });
  }
}

/// @nodoc
abstract class _$$_StorageItemCopyWith<$Res>
    implements $StorageItemCopyWith<$Res> {
  factory _$$_StorageItemCopyWith(
          _$_StorageItem value, $Res Function(_$_StorageItem) then) =
      __$$_StorageItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {StorageItemType type,
      String path,
      String name,
      int level,
      List<StorageItem> children,
      StorageItem? parent,
      String? downloadUrl});

  @override
  $StorageItemCopyWith<$Res>? get parent;
}

/// @nodoc
class __$$_StorageItemCopyWithImpl<$Res> extends _$StorageItemCopyWithImpl<$Res>
    implements _$$_StorageItemCopyWith<$Res> {
  __$$_StorageItemCopyWithImpl(
      _$_StorageItem _value, $Res Function(_$_StorageItem) _then)
      : super(_value, (v) => _then(v as _$_StorageItem));

  @override
  _$_StorageItem get _value => super._value as _$_StorageItem;

  @override
  $Res call({
    Object? type = freezed,
    Object? path = freezed,
    Object? name = freezed,
    Object? level = freezed,
    Object? children = freezed,
    Object? parent = freezed,
    Object? downloadUrl = freezed,
  }) {
    return _then(_$_StorageItem(
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StorageItemType,
      path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      children: children == freezed
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<StorageItem>,
      parent: parent == freezed
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as StorageItem?,
      downloadUrl: downloadUrl == freezed
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StorageItem extends _StorageItem {
  const _$_StorageItem(this.type, this.path, this.name, this.level,
      {final List<StorageItem> children = const <StorageItem>[],
      this.parent,
      this.downloadUrl})
      : _children = children,
        super._();

  factory _$_StorageItem.fromJson(Map<String, dynamic> json) =>
      _$$_StorageItemFromJson(json);

  @override
  final StorageItemType type;
  @override
  final String path;
  @override
  final String name;
  @override
  final int level;
  final List<StorageItem> _children;
  @override
  @JsonKey()
  List<StorageItem> get children {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  final StorageItem? parent;
  @override
  final String? downloadUrl;

  @override
  String toString() {
    return 'StorageItem(type: $type, path: $path, name: $name, level: $level, children: $children, parent: $parent, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StorageItem &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            const DeepCollectionEquality().equals(other.parent, parent) &&
            const DeepCollectionEquality()
                .equals(other.downloadUrl, downloadUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(_children),
      const DeepCollectionEquality().hash(parent),
      const DeepCollectionEquality().hash(downloadUrl));

  @JsonKey(ignore: true)
  @override
  _$$_StorageItemCopyWith<_$_StorageItem> get copyWith =>
      __$$_StorageItemCopyWithImpl<_$_StorageItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StorageItemToJson(
      this,
    );
  }
}

abstract class _StorageItem extends StorageItem {
  const factory _StorageItem(final StorageItemType type, final String path,
      final String name, final int level,
      {final List<StorageItem> children,
      final StorageItem? parent,
      final String? downloadUrl}) = _$_StorageItem;
  const _StorageItem._() : super._();

  factory _StorageItem.fromJson(Map<String, dynamic> json) =
      _$_StorageItem.fromJson;

  @override
  StorageItemType get type;
  @override
  String get path;
  @override
  String get name;
  @override
  int get level;
  @override
  List<StorageItem> get children;
  @override
  StorageItem? get parent;
  @override
  String? get downloadUrl;
  @override
  @JsonKey(ignore: true)
  _$$_StorageItemCopyWith<_$_StorageItem> get copyWith =>
      throw _privateConstructorUsedError;
}
