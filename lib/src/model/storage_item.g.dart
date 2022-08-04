// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StorageItem _$$_StorageItemFromJson(Map<String, dynamic> json) =>
    _$_StorageItem(
      $enumDecode(_$StorageItemTypeEnumMap, json['type']),
      json['path'] as String,
      json['name'] as String,
      json['level'] as int,
      children: (json['children'] as List<dynamic>?)
              ?.map((e) => StorageItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <StorageItem>[],
      parent: json['parent'] == null
          ? null
          : StorageItem.fromJson(json['parent'] as Map<String, dynamic>),
      downloadUrl: json['downloadUrl'] as String?,
    );

Map<String, dynamic> _$$_StorageItemToJson(_$_StorageItem instance) =>
    <String, dynamic>{
      'type': _$StorageItemTypeEnumMap[instance.type]!,
      'path': instance.path,
      'name': instance.name,
      'level': instance.level,
      'children': instance.children,
      'parent': instance.parent,
      'downloadUrl': instance.downloadUrl,
    };

const _$StorageItemTypeEnumMap = {
  StorageItemType.file: 'file',
  StorageItemType.folder: 'folder',
};
