import 'package:get_it/get_it.dart';
import 'package:how_about_now/injectable/injectable.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
