import 'package:injectable/injectable.dart';

@lazySingleton
class TestsManager {
  bool duringTestExecution = false;
}
