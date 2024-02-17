import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/presentation/pages/add_task/add_task_page.dart';
import 'package:how_about_now/presentation/pages/add_task/cubit/add_task_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../golden_test_runner.dart';
import '../../mocked_data.dart';
import '../../mocks.mocks.dart';

void main() {
  late MockAddTaskCubit mockAddTaskCubit;
  setUp(() {
    mockAddTaskCubit = MockAddTaskCubit();
    when(mockAddTaskCubit.state).thenAnswer((_) => const AddTaskState.loaded());
    when(mockAddTaskCubit.stream).thenAnswer((_) => Stream.value(const AddTaskState.loaded()));
    when(mockAddTaskCubit.close()).thenAnswer((_) async {});
  });

  Widget buildPage() => AddTaskPage(categories: taskCategoriesList, cubit: mockAddTaskCubit);

  runGoldenTest(
    'AddTaskPage - Loaded',
    builder: buildPage,
  );

  runGoldenTest(
    'AddTaskPage - Calendar tapped',
    whilePerforming: (tester) async {
      final calendarButton = find.byIcon(Icons.calendar_today_rounded);
      await tester.tap(calendarButton, warnIfMissed: false);
      return;
    },
    builder: buildPage,
  );

  runGoldenTest(
    'AddTaskPage - Task Category tapped',
    whilePerforming: (tester) async {
      final taskCategoryButton = find.byIcon(Icons.circle);
      await tester.tap(taskCategoryButton, warnIfMissed: false);
      return;
    },
    builder: buildPage,
  );
}
