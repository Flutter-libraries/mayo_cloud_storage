import 'dart:io';

import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';

const kValidFolder = 'AwesomeFolder';
const kInvalidFolder = 'InvalidFolder';
const kValidFile = 'AwesomeFile.txt';
void main() {
  group('FirebaseStorage', () {
    test('Puts File', () async {
      final storage = MockFirebaseStorage();
      final storageRef = storage.ref().child(kValidFolder);
      final image = File(kValidFolder);
      final task = storageRef.putFile(image);
      await task;

      expect(
        task.snapshot.ref.fullPath,
        equals('gs://some-bucket/$kValidFolder'),
      );
      expect(storage.storedFilesMap.containsKey('/$kValidFolder'), isTrue);
    });
  });

  group('Cloud storage test', () {
    final instance = MockFirebaseStorage();

    setUp(() async {});
    test('Get $kValidFile file', () async {
      const path = kValidFolder;
      final ref = instance.ref('/$path/');

      final storageRef = ref.child(kValidFile);
      final awesomeFile = File(kValidFile);
      final task = storageRef.putFile(awesomeFile);
      await task;

      expect(
        ref.fullPath,
        equals('gs://some-bucket/$path/'),
      );
      expect(
        task.snapshot.ref.fullPath,
        equals('gs://some-bucket/$path/$kValidFile'),
      );

      instance.storedFilesMap.keys;
      expect(
        instance.storedFilesMap.containsKey(
          '/$path/$kValidFile',
        ),
        isTrue,
      );
    });
  });
}
