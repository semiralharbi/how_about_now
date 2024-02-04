import 'package:how_about_now/presentation/utils/router/app_router.dart';
import 'package:injectable/injectable.dart';



@module
abstract class AppRouterModule {
  @lazySingleton
  AppRouter get instance => AppRouter();
}
