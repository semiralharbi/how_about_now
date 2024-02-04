import 'package:flutter_test/flutter_test.dart';
import 'package:how_about_now/presentation/pages/home_page/home_page.dart';
import 'package:how_about_now/presentation/pages/home_page/widgets/task_list_tile.dart';

import '../../golden_test_runner.dart';

void main() {
  runGoldenTest(
    'HomePage - Loaded',
    builder: HomePage.new,
  );

  runGoldenTest(
    'HomePage - Loaded Scrolled',
    whilePerforming: (tester) async {
      final taskListTile = find.byType(TaskListTile);
      await tester.drag(taskListTile.at(4), const Offset(0, -200), warnIfMissed: false);
      return;
    },
    builder: HomePage.new,
  );
}
