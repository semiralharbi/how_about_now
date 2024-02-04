import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:how_about_now/injectable/injectable.dart';
import 'package:how_about_now/injectable/modules/tests_manager.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  getIt.registerLazySingleton(() => TestsManager()..duringTestExecution = true);
  return AlchemistConfig.runWithConfig(
    run: () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await loadAppFonts();
      await testMain();
    },
    config: const AlchemistConfig(ciGoldensConfig: CiGoldensConfig(enabled: false)),
  );
}
