import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/presentation/pages/add_task/add_task_page.dart';

import '../../golden_test_runner.dart';

void main() {
  runGoldenTest(
    'AddTaskPage - Loaded',
    builder: AddTaskPage.new,
  );

  runGoldenTest(
    'AddTaskPage - Calendar tapped',
    whilePerforming: (tester) async {
      final calendarButton = find.byIcon(Icons.calendar_today_rounded);
      await tester.tap(calendarButton, warnIfMissed: false);
      return;
    },
    builder: AddTaskPage.new,
  );

  runGoldenTest(
    'AddTaskPage - Task Category tapped',
    whilePerforming: (tester) async {
      final taskCategoryButton = find.byIcon(Icons.circle);
      await tester.tap(taskCategoryButton, warnIfMissed: false);
      return;
    },
    builder: AddTaskPage.new,
  );

  runGoldenTest(
    'AddTaskPage - New Task Category tapped',
    whilePerforming: (tester) async {
      final taskCategoryButton = find.byIcon(Icons.circle);
      await tester.tap(taskCategoryButton, warnIfMissed: false);
      await tester.pumpAndSettle();
      final newCategoryButton = find.byIcon(Icons.add);
      await tester.tap(newCategoryButton, warnIfMissed: false);
      return;
    },
    builder: AddTaskPage.new,
  );
}
