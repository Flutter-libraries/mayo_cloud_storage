import 'dart:developer';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mayo_cloud_storage/src/model/storage_item.dart';

/// Firebase error codes related with storage.
enum StorageFailureCodes {
  /// unknown code given by firebase
  unknown('unknown'),

  /// objectNotFound code given by firebase
  objectNotFound('object-not-found'),

  /// bucketNotFound code given by firebase
  bucketNotFound('bucket-not-found'),

  /// projectNotFound code given by firebase
  projectNotFound('project-not-found'),

  /// quotaExceeded code given by firebase
  quotaExceeded('quota-exceeded'),

  /// unauthenticated code given by firebase
  unauthenticated('unauthenticated'),

  /// unauthorized code given by firebase
  unauthorized('unauthorized'),

  /// retryLimitExceeded code given by firebase
  retryLimitExceeded('retry-limit-exceeded'),

  /// invalidChecksum code given by firebase
  invalidChecksum('invalid-checksum'),

  /// canceled code given by firebase
  canceled('canceled'),

  /// invalidEventName code given by firebase
  invalidEventName('invalid-event-name'),

  /// invalidUrl code given by firebase
  invalidUrl('invalid-url'),

  /// invalidArgument code given by firebase
  invalidArgument('invalid-argument'),

  /// noDefaultBucket code given by firebase
  noDefaultBucket('no-default-bucket'),

  /// cannotSliceBlob code given by firebase
  cannotSliceBlob('cannot-slice-blob'),

  /// serverFileWrongSize code given by firebase
  serverFileWrongSize('server-file-wrong-size');

  /// Constructor
  const StorageFailureCodes(this.code);

  /// Code param
  final String code;
}

/// {@template storage_failure}
/// Thrown if during the sign up process if a failure occurs.
/// {@endtemplate}
class StorageFailure implements Exception {
  /// {@macro storage_failure}
  const StorageFailure([
    this.code = 'unknown',
    this.message = 'An unknown exception occurred.',
    this.path,
    this.stackTrace,
  ]);

  /// Create a firebase storage message
  /// from a firebase storage exception code.
  /// https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwiHgOztuJ34AhWRwYUKHSLlBSEQFnoECCcQAQ&url=https%3A%2F%2Ffirebase.flutter.dev%2Fdocs%2Fauth%2Ferror-handling%2F&usg=AOvVaw0ogGX6sFtirrrutjo3euS5
  factory StorageFailure.fromCode(
    String code, {
    String? path,
    String? stackTrace,
  }) {
    if (code == StorageFailureCodes.unknown.code) {
      return StorageFailure(
        code,
        'An unknown error occurred.',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.objectNotFound.code) {
      return StorageFailure(
        code,
        'No object exists at the desired reference. Path: $path',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.bucketNotFound.code) {
      return StorageFailure(
        code,
        'No bucket is configured for Cloud Storage',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.projectNotFound.code) {
      return StorageFailure(
        code,
        'No project is configured for Cloud Storage',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.quotaExceeded.code) {
      return StorageFailure(
        code,
        """
Quota on your Cloud Storage bucket has been exceeded. If you're on the no-cost tier, upgrade to a paid plan. If you're on a paid plan, reach out to Firebase support.""",
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.unauthenticated.code) {
      return StorageFailure(
        code,
        'User is unauthenticated, please authenticate and try again.',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.unauthorized.code) {
      return StorageFailure(
        code,
        '''
User is not authorized to perform the desired action, check your security rules to ensure they are correct.''',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.retryLimitExceeded.code) {
      return StorageFailure(
        code,
        '''
The maximum time limit on an operation (upload, download, delete, etc.) has been excceded. Try uploading again.''',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.invalidChecksum.code) {
      return StorageFailure(
        code,
        '''
File on the client does not match the checksum of the file received by the server. Try uploading again.''',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.canceled.code) {
      return StorageFailure(
        code,
        'User canceled the operation.',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.invalidEventName.code) {
      return StorageFailure(
        code,
        '''
Invalid event name provided. Must be one of [running, progress, pause]''',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.invalidUrl.code) {
      return StorageFailure(
        code,
        'Invalid URL provided to refFromURL(). Must be of the form: gs://bucket/object or https://firebasestorage.googleapis.com/v0/b/bucket/o/object?token=<TOKEN>',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.invalidArgument.code) {
      return StorageFailure(
        code,
        '''
The argument passed to put() must be File, Blob, or UInt8 Array. The argument passed to putString() must be a raw, Base64, or Base64URL string.''',
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.noDefaultBucket.code) {
      return StorageFailure(
        code,
        "No bucket has been set in your config's storageBucket property.",
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.cannotSliceBlob.code) {
      return StorageFailure(
        code,
        """
Commonly occurs when the local file has changed (deleted, saved again, etc.). Try uploading again after verifying that the file hasn't changed.""",
        path,
        stackTrace,
      );
    } else if (code == StorageFailureCodes.serverFileWrongSize.code) {
      return StorageFailure(
        code,
        '''
File on the client does not match the size of the file recieved by the server. Try uploading again.''',
        path,
        stackTrace,
      );
    } else {
      return const StorageFailure();
    }
  }

  /// The associated code.
  final String code;

  /// The associated error message.
  final String message;

  /// Exception stack trace
  final String? stackTrace;

  /// Accesing path
  final String? path;
}

///
class StorageDataProvider {
  ///
  StorageDataProvider(this.storage);

  ///
  final FirebaseStorage storage;

  /// Put [content] on [path].
  Future<void> putStringToPath(
    String path,
    String content, {
    SettableMetadata? metadata,
    PutStringFormat? format,
  }) async {
    try {
      final ref = storage.ref().child(path);
      await ref.putString(
        content,
        metadata: metadata,
        format: format ?? PutStringFormat.raw,
      );
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    } catch (_) {
      throw const StorageFailure();
    }
  }

  /// Put [data] on [path].
  Future<void> putDataToPath(
    String path,
    Uint8List data, {
    SettableMetadata? metadata,
  }) async {
    try {
      final ref = storage.ref().child(path);
      await ref.putData(
        data,
        metadata,
      );
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    } catch (_) {
      throw const StorageFailure();
    }
  }

  /// Put [data] on [path].
  Future<void> putBlobToPath(
    String path,
    dynamic data, {
    SettableMetadata? metadata,
  }) async {
    try {
      final ref = storage.ref().child(path);
      await ref.putBlob(
        data,
        metadata,
      );
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    } catch (_) {
      throw const StorageFailure();
    }
  }

  /// Put [content] on [path]. Get [onSuccess] callback if success.
  /// Get upload progress on [onProgressUpdated] callback.
  /// Get [onPaused] callback if paused. Get [onCanceled] callback if canceled.
  void putStringToPathWithProgressInfo(
    String path,
    String content,
    SettableMetadata? metadata,
    void Function() onSuccess,
    void Function(double)? onProgressUpdated,
    void Function(double)? onPaused,
    void Function(double)? onCanceled,
  ) {
    try {
      final ref = storage.ref().child(path);
      final uploadTask = ref.putString(content, metadata: metadata);

      uploadTask.snapshotEvents.listen((e) {
        switch (e.state) {
          case TaskState.running:
            if (onProgressUpdated != null) {
              onProgressUpdated(100.0 * (e.bytesTransferred / e.totalBytes));
            }

            break;
          case TaskState.paused:
            if (onPaused != null) {
              onPaused(100.0 * (e.bytesTransferred / e.totalBytes));
            }

            break;
          case TaskState.success:
            onSuccess();
            // ...
            break;
          case TaskState.canceled:
            if (onCanceled != null) {
              onCanceled(100.0 * (e.bytesTransferred / e.totalBytes));
            }

            break;
          case TaskState.error:
            break;
        }
      });
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    } catch (_) {
      throw const StorageFailure();
    }
  }

  /// Put [data] on [path]. Get [onSuccess] callback if success.
  /// Get upload progress on [onProgressUpdated] callback.
  /// Get [onPaused] callback if paused. Get [onCanceled] callback if canceled.
  void putDataToPathWithProgressInfo(
    String path,
    Uint8List data,
    SettableMetadata? metadata,
    void Function() onSuccess,
    void Function(double)? onProgressUpdated,
    void Function(double)? onPaused,
    void Function(double)? onCanceled,
  ) {
    try {
      final ref = storage.ref().child(path);
      final uploadTask = ref.putData(data, metadata);

      uploadTask.snapshotEvents.listen((e) {
        switch (e.state) {
          case TaskState.running:
            if (onProgressUpdated != null) {
              onProgressUpdated(100.0 * (e.bytesTransferred / e.totalBytes));
            }

            break;
          case TaskState.paused:
            if (onPaused != null) {
              onPaused(100.0 * (e.bytesTransferred / e.totalBytes));
            }

            break;
          case TaskState.success:
            onSuccess();
            // ...
            break;
          case TaskState.canceled:
            if (onCanceled != null) {
              onCanceled(100.0 * (e.bytesTransferred / e.totalBytes));
            }

            break;
          case TaskState.error:
            break;
        }
      });
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    } catch (_) {
      throw const StorageFailure();
    }
  }

  /// Check if [path] exists
  Future<bool> folderIsEmpty(String path) async {
    try {
      final url = await storage.ref().child(path).list(
            const ListOptions(
              maxResults: 1,
            ),
          );

      return url.items.isNotEmpty;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  /// Get Item from [path]
  Future<StorageItem> getFolder(String path) async {
    try {
      final item = storage.ref().child(path);
      if ((await item.getData()) == null) {
        throw StorageFailure.fromCode(
          StorageFailureCodes.objectNotFound.code,
          path: path,
        );
      }
      return StorageItem.folder(
        item,
        _deepLevel(item),
      );
    } on StorageFailure {
      rethrow;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  /// Get Item from [path]
  Future<StorageItem> getFile(
    String path, {
    bool generateDownloadUrl = false,
  }) async {
    try {
      final item = storage.ref().child(path);
      if ((await item.getData()) == null) {
        throw StorageFailure.fromCode(
          StorageFailureCodes.objectNotFound.code,
          path: path,
        );
      }
      return StorageItem.file(
        item,
        _deepLevel(item),
        downloadUrl: generateDownloadUrl ? await item.getDownloadURL() : null,
      );
    } on StorageFailure {
      rethrow;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  /// Get Item from [path]
  Future<Uint8List> getFileData(
    String path,
  ) async {
    try {
      final item = storage.ref().child(path);
      final data = await item.getData();
      if (data == null) {
        throw StorageFailure.fromCode(
          StorageFailureCodes.objectNotFound.code,
          path: path,
        );
      }
      return data;
    } on StorageFailure {
      rethrow;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  /// Get data from [url]
  Future<Uint8List> getDataFromURL(String url) async {
    try {
      final item = storage.ref().child(url);
      final data = await item.getData();
      if (data == null) {
        throw StorageFailure.fromCode(
          StorageFailureCodes.objectNotFound.code,
          path: url,
        );
      }
      return data;
    } on StorageFailure {
      rethrow;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: url,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  /// Fetch all items on [path]
  Future<StorageItem> fetchAllFilesFromPath(
    String path, {
    bool includeFiles = true,
    bool includeFolders = true,
    bool generateDownloadUrl = false,
  }) async {
    final ref = storage.ref().child(path);

    final results = await ref.list();

    final folders = includeFolders
        ? results.prefixes
            .map<StorageItem>(
              (folder) => StorageItem.folder(folder, _deepLevel(folder)),
            )
            .toList()
        : <StorageItem>[];

    // files
    final files = includeFiles
        ? await Future.wait(
            results.items
                .map(
                  (file) async => StorageItem.file(
                    file,
                    _deepLevel(file),
                    downloadUrl: generateDownloadUrl
                        ? (await file.getDownloadURL())
                        : null,
                  ),
                )
                .toList(),
          )
        : <StorageItem>[];

    return StorageItem.folder(
      ref,
      _deepLevel(ref),
      children: [...folders, ...files],
    );
  }

  /// Get [itemName] from [path]
  Future<Reference> getItemByName(String path, String itemName) async {
    try {
      final ref = storage.ref();
      final results = await ref.child(path).listAll();

      final item = results.items.firstWhere(
        (element) => element.name == itemName,
        orElse: () => throw StorageFailure.fromCode(
          StorageFailureCodes.objectNotFound.code,
          path: '$path/$itemName',
        ),
      );
      return item;
    } on StorageFailure {
      rethrow;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  /// Build structure of files from demoScripts folder
  Future<StorageItem> folderTree({
    String path = '',
    int level = 0,
    StorageItem? parent,
  }) async {
    try {
      final ref = storage.ref().child(path);

      final item = StorageItem(
        StorageItemType.folder,
        ref.fullPath,
        ref.name,
        level,
        parent: parent,
      );

      final itemList = await ref.listAll();

      // Folders
      final folders = await Future.wait(
        itemList.prefixes.map(
          (folder) async => folderTree(
            path: folder.fullPath,
            level: level + 1,
            parent: item,
          ),
        ),
      );

      // files
      final files = itemList.items
          .map(
            (file) => StorageItem(
              StorageItemType.file,
              file.fullPath,
              file.name,
              level,
              parent: item,
            ),
          )
          .toList();
      return item.copyWith(children: [...folders, ...files]);
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace?.toString(),
      );
    } catch (_) {
      throw const StorageFailure();
    }
  }

  /// Delete items in [path]
  Future<void> deleteItemsInPath(
    String path, {
    List<String> excludePaths = const <String>[],
    void Function(double)? onProgressUpdated,
  }) async {
    try {
      final ref = storage.ref(path);
      final results = await ref.listAll();
      final totalFiles = results.items.length;
      var count = 0;
      for (final item in results.items) {
        if (excludePaths.contains(item.name)) continue;
        await item.delete();
        count++;
        if (onProgressUpdated != null) onProgressUpdated(count / totalFiles);
      }
    } on StorageFailure {
      rethrow;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  /// Delete item in [path]
  Future<void> deleteItem(
    String path,
  ) async {
    try {
      final ref = storage.ref(path);
      await ref.delete();
    } on StorageFailure {
      rethrow;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  ///
  int _deepLevel(Reference ref) {
    // Calculate recursevly the deep level of the item
    if (ref.parent != null) {
      return _deepLevel(ref.parent!) + 1;
    } else {
      return 0;
    }
  }

  /// Copy files from [sourcePath] to [destinationPath]
  Future<void> copyFileToPath(
    String sourcePath,
    String destinationPath,
    Map<String, String>? customMetadata,
  ) async {
    try {
      final sourceRef = storage.ref(sourcePath);
      final destinationRef = storage.ref(destinationPath);

      await destinationRef.putData(
        (await sourceRef.getData())!,
        customMetadata != null
            ? SettableMetadata(customMetadata: customMetadata)
            : null,
      );
    } on StorageFailure {
      rethrow;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: sourcePath,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  /// Move files from [sourcePath] to [destinationPath]
  Future<void> moveFileToPath(
    String sourcePath,
    String destinationPath,
    Map<String, String>? customMetadata,
  ) async {
    try {
      final sourceRef = storage.ref(sourcePath);
      final destinationRef = storage.ref(destinationPath);

      await destinationRef.putData(
        (await sourceRef.getData())!,
        customMetadata != null
            ? SettableMetadata(customMetadata: customMetadata)
            : null,
      );
    } on StorageFailure {
      rethrow;
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: sourcePath,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }

  /// Copy files from [sourcePath] to [destinationPath]
  Future<void> copyContentToPath(
    String sourcePath,
    String destinationPath, {
    bool includeSubfolders = false,
    bool isRootFolder = true,
    Map<String, String>? customMetadata,
    List<String> excludePaths = const [],
    void Function(double)? onProgressUpdated,
  }) async {
    final sourceRef = storage.ref(sourcePath);
    final destinationRef = storage.ref(destinationPath);

    return sourceRef.listAll().then((results) async {
      final totalFiles = results.items.length;
      final totalFolders = includeSubfolders ? results.prefixes.length : 0;
      final totalElements = totalFiles + totalFolders;

      var elementIndex = 0;

      var folderPartialProgress = 0.0;

      // Progress for entiere folder
      if (includeSubfolders) {
        for (final folder in results.prefixes
            .where((prefix) => !excludePaths.contains(prefix.name))
            .toList()) {
          await copyContentToPath(
            '$sourcePath/${folder.name}',
            '$destinationPath/${folder.name}',
            includeSubfolders: true,
            isRootFolder: false,
            customMetadata: customMetadata,
            onProgressUpdated: (partialProgress) {
              folderPartialProgress = (elementIndex / totalElements) +
                  (partialProgress / totalElements);
              log('Folder ${folder.fullPath}. Progress $folderPartialProgress');
              onProgressUpdated?.call(folderPartialProgress);
            },
          );
          elementIndex++;
        }
      }

      // Partial progress for files
      var count = 0;
      for (final item in results.items
          .where((i) => !excludePaths.contains(i.name))
          .toList()) {
        final metadata = await item.getMetadata();
        final destinationItem = destinationRef.child(item.name);
        await destinationItem.putData(
          (await item.getData())!,
          SettableMetadata(
            contentType: metadata.contentType,
            customMetadata: customMetadata,
          ),
        );
        count++;
        final fileProgress = count / totalFiles;

        if (totalFolders > 0) {
          onProgressUpdated?.call(
            ((elementIndex + 1) / totalElements) +
                (fileProgress / totalElements),
          );
        } else {
          onProgressUpdated?.call(fileProgress);
        }
        log('${item.fullPath}. Progress $fileProgress');
      }
    });
  }

  /// Get URL from [path]
  Future<String> getDownloadUrlFromPath(String path) async {
    try {
      return storage.ref(path).getDownloadURL();
    } on FirebaseException catch (err) {
      throw StorageFailure.fromCode(
        err.code,
        path: path,
        stackTrace: err.stackTrace.toString(),
      );
    }
  }
}
