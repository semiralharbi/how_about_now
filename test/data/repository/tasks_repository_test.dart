import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/data/repositories/tasks_repository_impl.dart';
import 'package:how_about_now/domain/repositories/tasks_repository.dart';
import 'package:how_about_now/domain/utils/exception.dart';
import 'package:how_about_now/presentation/utils/enums/errors.dart';
import 'package:mockito/mockito.dart';

import '../../mocked_data.dart';
import '../../mocks.mocks.dart';

void main() {
  group('TasksRepositoryImpl', () {
    late TasksRepository repository;
    late MockTasksDataSource mockDataSource;

    setUp(() {
      mockDataSource = MockTasksDataSource();
      repository = TasksRepositoryImpl(mockDataSource);
    });

    test('createTask delegates to TasksDataSource', () async {
      when(mockDataSource.createTask(any)).thenAnswer((_) async {});

      await repository.createTask(taskDtoV1);

      verify(mockDataSource.createTask(any));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('deleteTask delegates to TasksDataSource', () async {
      when(mockDataSource.deleteTask(any)).thenAnswer((_) async {});

      await repository.deleteTask(taskDtoV1.id);

      verify(mockDataSource.deleteTask(any));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('getTasks delegates to TasksDataSource', () async {
      when(mockDataSource.getTodayTasks()).thenAnswer((_) => Stream.value(tasksListV1));

      final result = repository.getTasks();

      expect(await result.first, tasksListV1);
      verify(mockDataSource.getTodayTasks());
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return a list with "General" and "All Tasks" categories when no tasks are present', () async {
      when(mockDataSource.getAllTasks()).thenAnswer((_) => Stream.value([]));

      final categories = await repository.getTasksCategories();

      expect(categories.length, 2);
      expect(categories.first.name, 'All Tasks');
      expect(categories[1].name, 'General');

      verify(mockDataSource.getAllTasks());
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should include a "Today" category if there are tasks for today', () async {
      when(mockDataSource.getAllTasks()).thenAnswer((_) => Stream.value([taskForToday]));

      final categories = await repository.getTasksCategories();

      expect(categories.first.name, 'Today');
      expect(categories.length, greaterThanOrEqualTo(3));

      verify(mockDataSource.getAllTasks());
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return a Stream of tasks from category "Today"', () async {
      when(mockDataSource.getTodayTasks()).thenAnswer((_) => Stream.value([taskForToday]));

      final result = repository.getTasksByCategory('Today');

      expect(await result.first, [taskForToday]);
      verify(mockDataSource.getTodayTasks());
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return a Stream of tasks from category "All Tasks"', () async {
      when(mockDataSource.getAllTasks()).thenAnswer((_) => Stream.value(tasksLongListV1));

      final result = repository.getTasksByCategory('All Tasks');

      expect(await result.first, tasksLongListV1);
      verify(mockDataSource.getAllTasks());
      verifyNoMoreInteractions(mockDataSource);
    });

    test('should return a Stream of tasks from the specified category', () async {
      when(mockDataSource.getTasksByCategory(any)).thenAnswer((_) => Stream.value([taskDtoV1, taskDtoV5]));

      final result = repository.getTasksByCategory('General');

      expect(await result.first, [taskDtoV1, taskDtoV5]);
      verify(mockDataSource.getTasksByCategory(any));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('calls completeTask on tasksDataSource with correct parameters', () async {
      const String testId = 'testId';
      const bool testIsCompleted = true;
      when(mockDataSource.completeTask(id: anyNamed('id'), isCompleted: anyNamed('isCompleted')))
          .thenAnswer((_) async {});

      await repository.completeTask(id: testId, isCompleted: testIsCompleted);

      verify(mockDataSource.completeTask(id: testId, isCompleted: testIsCompleted));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('rethrows any exception that occurs when calling completeTask', () {
      const String testId = 'testId';
      const bool testIsCompleted = true;
      when(mockDataSource.completeTask(id: anyNamed('id'), isCompleted: anyNamed('isCompleted')))
          .thenThrow(ApiException(Errors.somethingWentWrong));

      expect(
        () async => repository.completeTask(id: testId, isCompleted: testIsCompleted),
        throwsA(isA<ApiException>()),
      );
      verify(mockDataSource.completeTask(id: anyNamed('id'), isCompleted: anyNamed('isCompleted')));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('createTask propagates exception from DataSource', () async {
      when(mockDataSource.createTask(any)).thenThrow(ApiException(Errors.somethingWentWrong));

      expect(() => repository.createTask(taskDtoV1), throwsA(const TypeMatcher<ApiException>()));
      verify(mockDataSource.createTask(any));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('deleteTask propagates exception from DataSource', () async {
      when(mockDataSource.deleteTask(any)).thenThrow(ApiException(Errors.somethingWentWrong));

      expect(() => repository.deleteTask(taskDtoV1.id), throwsA(const TypeMatcher<ApiException>()));
      verify(mockDataSource.deleteTask(any));
      verifyNoMoreInteractions(mockDataSource);
    });

    test('getTasks propagates exception from DataSource', () async {
      when(mockDataSource.getTodayTasks()).thenThrow(ApiException(Errors.somethingWentWrong));

      expect(() => repository.getTasks(), throwsA(const TypeMatcher<ApiException>()));
      verify(mockDataSource.getTodayTasks());
      verifyNoMoreInteractions(mockDataSource);
    });
  });
}
