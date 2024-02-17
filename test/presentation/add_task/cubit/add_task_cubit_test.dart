import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/domain/utils/exception.dart';
import 'package:how_about_now/presentation/pages/add_task/cubit/add_task_cubit.dart';
import 'package:how_about_now/presentation/utils/enums/errors.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  group('AddTaskCubit', () {
    late AddTaskCubit cubit;
    late MockTasksRepository mockTasksRepository;

    setUp(() {
      mockTasksRepository = MockTasksRepository();
      cubit = AddTaskCubit(mockTasksRepository);
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state is AddTaskState.loaded()', () {
      expect(cubit.state, equals(const AddTaskState.loaded()));
    });

    blocTest<AddTaskCubit, AddTaskState>(
      'emits [loading, success] when createTask is successful',
      build: () => cubit,
      act: (cubit) => cubit.createTask(
        title: 'Test Task',
        category: 'Test Category',
        color: 'Test Color',
        date: DateTime.now(),
      ),
      expect: () => [
        const AddTaskState.loading(),
        const AddTaskState.success(),
      ],
    );

    blocTest<AddTaskCubit, AddTaskState>(
      'emits [loading, error] when createTask fails with ApiException',
      build: () => cubit,
      act: (cubit) {
        when(mockTasksRepository.createTask(any)).thenThrow(ApiException(Errors.somethingWentWrong));
        cubit.createTask(
          title: 'Test Task',
          category: 'Test Category',
          color: 'Test Color',
          date: DateTime.now(),
        );
      },
      expect: () => [
        const AddTaskState.loading(),
        const AddTaskState.error(Errors.somethingWentWrong),
      ],
    );
  });
}
