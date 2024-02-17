import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocked_data.dart';

Future<void> expectFirestoreSetCall({
  required FakeFirebaseFirestore fakeFirebaseFirestore,
  required Map<String, dynamic> data,
  required String docPath,
}) async {
  final collection = fakeFirebaseFirestore.collection(userId);
  await collection.doc(docPath).set(data);
  final result = await collection.doc(docPath).get();
  debugPrint('Result data: ${result.data()}');
  expect(result.data(), data);
}

Future<void> expectFirestoreGetCall({
  required FakeFirebaseFirestore fakeFirebaseFirestore,
  required dynamic matcher,
  required String docPath,
}) async {
  final collection = fakeFirebaseFirestore.collection(userId);
  final result = await collection.doc(docPath).get();
  debugPrint('Result data: ${result.data()}');
  expect(result.data(), matcher);
}
