import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/presentation/pages/home_page/cubit/home_cubit.dart';
import 'package:how_about_now/presentation/pages/home_page/home_page.dart';
import 'package:how_about_now/presentation/pages/home_page/widgets/task_list_tile.dart';
import 'package:mockito/mockito.dart';

import '../../golden_test_runner.dart';
import '../../mocked_data.dart';
import '../../mocks.mocks.dart';

void main() {
  late MockHomeCubit mockHomeCubit;
  setUp(() {
    mockHomeCubit = MockHomeCubit();
    when(mockHomeCubit.state).thenAnswer((_) => HomeState.loaded(tasks: tasksListV1, categories: taskCategoriesList));
    when(mockHomeCubit.stream).thenAnswer(
      (_) => Stream.value(
        HomeState.loaded(tasks: tasksListV1, categories: taskCategoriesList),
      ),
    );
    when(mockHomeCubit.close()).thenAnswer((_) async {});
  });

  Widget buildPage() => BlocProvider(
        create: (context) => mockHomeCubit,
        child: HomePage(cubit: mockHomeCubit),
      );

  runGoldenTest(
    'HomePage - Loaded',
    builder: buildPage,
  );

  runGoldenTest(
    'HomePage - Loaded Scrolled',
    whilePerforming: (tester) async {
      final taskListTile = find.byType(TaskListTile);
      await tester.drag(taskListTile.at(1), const Offset(0, -200), warnIfMissed: false);
      return;
    },
    builder: () {
      when(mockHomeCubit.state)
          .thenAnswer((_) => HomeState.loaded(tasks: tasksLongListV1, categories: taskCategoriesList));
      when(mockHomeCubit.stream).thenAnswer(
        (_) => Stream.value(
          HomeState.loaded(tasks: tasksLongListV1, categories: taskCategoriesList),
        ),
      );
      return buildPage();
    },
  );
}
