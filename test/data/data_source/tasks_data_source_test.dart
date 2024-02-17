import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/data/data_source/tasks_data_source_impl.dart';
import 'package:how_about_now/domain/utils/shared_preferences_consts.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/firebase_testing_helpers.dart';
import '../../mocked_data.dart';
import '../../mocks.mocks.dart';

void main() {
  group('TasksDataSourceImpl', () {
    late TasksDataSourceImpl dataSource;
    late FakeFirebaseFirestore mockFirestore;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockFirestore = FakeFirebaseFirestore();
      mockSharedPreferences = MockSharedPreferences();
      dataSource = TasksDataSourceImpl(mockFirestore, mockSharedPreferences);
    });

    test('createTask creates a task in FirebaseFirestore', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(userId);

      await dataSource.createTask(taskDtoV1);
      await expectFirestoreGetCall(
        fakeFirebaseFirestore: mockFirestore,
        docPath: taskDtoV1.id,
        matcher: taskDtoV1.toJson(),
      );

      verify(mockSharedPreferences.getString(any));
    });

    test('deleteTask deletes task by id from FirebaseFirestore', () async {
      when(mockSharedPreferences.getString(any)).thenReturn(userId);
      await expectFirestoreSetCall(
        fakeFirebaseFirestore: mockFirestore,
        data: taskDtoV1.toJson(),
        docPath: taskDtoV1.id,
      );

      await dataSource.deleteTask(taskDtoV1.id);

      await expectFirestoreGetCall(
        fakeFirebaseFirestore: mockFirestore,
        matcher: null,
        docPath: taskDtoV1.id,
      );
      verify(mockSharedPreferences.getString(any));
    });

    test('getTasks fetches all user tasks from FirebaseFirestore', () async {
      for (final task in tasksListV1) {
        await expectFirestoreSetCall(
          fakeFirebaseFirestore: mockFirestore,
          data: task.toJson(),
          docPath: task.id,
        );
      }
      when(mockSharedPreferences.getString(SharedPreferencesConsts.userIdKey)).thenReturn(userId);
      final result = await dataSource.getTasks();

      expect(result, tasksListV1);
    });

    test('getTasksByCategory fetches tasks by category from FirebaseFirestore', () async {
      for (final task in tasksListV1) {
        await expectFirestoreSetCall(
          fakeFirebaseFirestore: mockFirestore,
          data: task.toJson(),
          docPath: task.id,
        );
      }
      when(mockSharedPreferences.getString(SharedPreferencesConsts.userIdKey)).thenReturn(userId);
      final result = await dataSource.getTasksByCategory(tasksListV1.first.category);

      expect(result, [taskDtoV1]);
    });
  });
}
