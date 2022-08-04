import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_item.freezed.dart';
part 'storage_item.g.dart';

/// Type of storage item.
enum StorageItemType {
  /// File type
  file,

  /// Folder type
  folder
}

@freezed

/// Wrap of storage item
class StorageItem with _$StorageItem {
  /// Constructor
  const factory StorageItem(
    StorageItemType type,
    String path,
    String name,
    int level, {
    @Default(<StorageItem>[]) List<StorageItem> children,
    StorageItem? parent,
    String? downloadUrl,
  }) = _StorageItem;

  /// Folder type
  factory StorageItem.folder(
    Reference reference,
    int level, {
    StorageItem? parent,
    List<StorageItem>? children,
  }) {
    return StorageItem(
      StorageItemType.folder,
      reference.fullPath,
      reference.name,
      level,
      parent: parent,
      children: children ?? <StorageItem>[],
    );
  }

  /// File type
  factory StorageItem.file(
    Reference reference,
    int level, {
    String? downloadUrl,
  }) {
    return StorageItem(
      StorageItemType.file,
      reference.fullPath,
      reference.name,
      level,
      parent: reference.parent != null
          ? StorageItem.folder(reference.parent!, level)
          : null,
      downloadUrl: downloadUrl,
    );
  }

  const StorageItem._();

  /// From json method
  factory StorageItem.fromJson(Map<String, dynamic> json) =>
      _$StorageItemFromJson(json);
}
