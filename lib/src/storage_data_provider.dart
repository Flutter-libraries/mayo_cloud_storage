import 'package:firebase_storage/firebase_storage.dart';

/// {@template storage_failure}
/// Thrown if during the sign up process if a failure occurs.
/// {@endtemplate}
class StorageFailure implements Exception {
  /// {@macro storage_failure}
  const StorageFailure([
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
    switch (code) {
      case 'unknown':
        return StorageFailure('An unknown error occurred.', path, stackTrace);
      case 'object-not-found':
        return StorageFailure(
          'No object exists at the desired reference. Path: $path',
          path,
          stackTrace,
        );
      case 'bucket-not-found':
        return StorageFailure(
          'No bucket is configured for Cloud Storage',
          path,
          stackTrace,
        );
      case 'project-not-found':
        return StorageFailure(
          'No project is configured for Cloud Storage',
          path,
          stackTrace,
        );
      case 'quota-exceeded':
        return StorageFailure(
          "Quota on your Cloud Storage bucket has been exceeded. If you're on the no-cost tier, upgrade to a paid plan. If you're on a paid plan, reach out to Firebase support.",
          path,
          stackTrace,
        );
      case 'unauthenticated':
        return StorageFailure(
          'User is unauthenticated, please authenticate and try again.',
          path,
          stackTrace,
        );
      case 'unauthorized':
        return StorageFailure(
          'User is not authorized to perform the desired action, check your security rules to ensure they are correct.',
          path,
          stackTrace,
        );
      case 'retry-limit-exceeded':
        return StorageFailure(
          'The maximum time limit on an operation (upload, download, delete, etc.) has been excceded. Try uploading again.',
          path,
          stackTrace,
        );
      case 'invalid-checksum':
        return StorageFailure(
          'File on the client does not match the checksum of the file received by the server. Try uploading again.',
          path,
          stackTrace,
        );
      case 'canceled':
        return StorageFailure('User canceled the operation.', path, stackTrace);
      case 'invalid-event-name':
        return StorageFailure(
          'Invalid event name provided. Must be one of [running, progress, pause]',
          path,
          stackTrace,
        );
      case 'invalid-url':
        return StorageFailure(
          'Invalid URL provided to refFromURL(). Must be of the form: gs://bucket/object or https://firebasestorage.googleapis.com/v0/b/bucket/o/object?token=<TOKEN>',
          path,
          stackTrace,
        );
      case 'invalid-argument':
        return StorageFailure(
          'The argument passed to put() must be File, Blob, or UInt8 Array. The argument passed to putString() must be a raw, Base64, or Base64URL string.',
          path,
          stackTrace,
        );
      case 'no-default-bucket':
        return StorageFailure(
          "No bucket has been set in your config's storageBucket property.",
          path,
          stackTrace,
        );
      case 'cannot-slice-blob':
        return StorageFailure(
          "Commonly occurs when the local file has changed (deleted, saved again, etc.). Try uploading again after verifying that the file hasn't changed.",
          path,
          stackTrace,
        );
      case 'server-file-wrong-size':
        return StorageFailure(
          'File on the client does not match the size of the file recieved by the server. Try uploading again.',
          path,
          stackTrace,
        );
      default:
        return const StorageFailure();
    }
  }

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

  /// Put [content] on [path]. Get [onSuccess] callback if success.
  /// Get upload progress on [onProgressUpdated] callback.
  /// Get [onPaused] callback if paused. Get [onCanceled] callback if canceled.
  void putStringToPathWithProgressInfo(
    String path,
    String content,
    void Function() onSuccess,
    void Function(double)? onProgressUpdated,
    void Function(double)? onPaused,
    void Function(double)? onCanceled,
  ) {
    try {
      final ref = storage.ref().child(path);
      final uploadTask = ref.putString(content);

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
}
