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
    });

    test('deleteTask delegates to TasksDataSource', () async {
      when(mockDataSource.deleteTask(any)).thenAnswer((_) async {});

      await repository.deleteTask(taskDtoV1.id);

      verify(mockDataSource.deleteTask(any));
    });

    test('getTasks delegates to TasksDataSource', () async {
      when(mockDataSource.getTasks()).thenAnswer((_) async => tasksListV1);

      final result = await repository.getTasks();

      expect(result, tasksListV1);
      verify(mockDataSource.getTasks());
    });

    test('should return a list with "General" and "All Tasks" categories when no tasks are present', () async {
      when(mockDataSource.getTasks()).thenAnswer((_) async => []);

      final categories = await repository.getTasksCategories();

      expect(categories.length, 2);
      expect(categories.first.name, 'All Tasks');
      expect(categories[1].name, 'General');
    });

    test('should include a "Today" category if there are tasks for today', () async {
      when(mockDataSource.getTasks()).thenAnswer((_) async => [taskForToday]);

      final categories = await repository.getTasksCategories();

      expect(categories.first.name, 'Today');
      expect(categories.length, greaterThanOrEqualTo(3));
    });

    test('createTask propagates exception from DataSource', () async {
      when(mockDataSource.createTask(any)).thenThrow(ApiException(Errors.somethingWentWrong));

      expect(() => repository.createTask(taskDtoV1), throwsA(const TypeMatcher<ApiException>()));
    });

    test('deleteTask propagates exception from DataSource', () async {
      when(mockDataSource.deleteTask(any)).thenThrow(ApiException(Errors.somethingWentWrong));

      expect(() => repository.deleteTask(taskDtoV1.id), throwsA(const TypeMatcher<ApiException>()));
    });

    test('getTasks propagates exception from DataSource', () async {
      when(mockDataSource.getTasks()).thenThrow(ApiException(Errors.somethingWentWrong));

      expect(() => repository.getTasks(), throwsA(const TypeMatcher<ApiException>()));
    });
  });
}
