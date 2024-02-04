// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:how_about_now/injectable/modules/app_router_module.dart' as _i6;
import 'package:how_about_now/injectable/modules/tests_manager.dart' as _i4;
import 'package:how_about_now/presentation/theme/theme_manager.dart' as _i5;
import 'package:how_about_now/presentation/utils/router/app_router.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appRouterModule = _$AppRouterModule();
    gh.lazySingleton<_i3.AppRouter>(() => appRouterModule.instance);
    gh.lazySingleton<_i4.TestsManager>(() => _i4.TestsManager());
    gh.singleton<_i5.ThemeManager>(_i5.ThemeManager());
    return this;
  }
}

class _$AppRouterModule extends _i6.AppRouterModule {}