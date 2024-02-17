// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:how_about_now/cubit/app_cubit.dart' as _i18;
import 'package:how_about_now/data/data_source/authentication_data_source_impl.dart' as _i14;
import 'package:how_about_now/data/data_source/tasks_data_source_impl.dart' as _i7;
import 'package:how_about_now/data/repositories/authentication_repository_impl.dart' as _i16;
import 'package:how_about_now/data/repositories/tasks_repository_impl.dart' as _i9;
import 'package:how_about_now/domain/data_source/authentication_data_source.dart' as _i13;
import 'package:how_about_now/domain/data_source/tasks_data_source.dart' as _i6;
import 'package:how_about_now/domain/repositories/authentication_repository.dart' as _i15;
import 'package:how_about_now/domain/repositories/tasks_repository.dart' as _i8;
import 'package:how_about_now/injectable/modules/app_router_module.dart' as _i19;
import 'package:how_about_now/injectable/modules/firebase_firestore_module.dart' as _i20;
import 'package:how_about_now/injectable/modules/shared_preferences_module.dart' as _i21;
import 'package:how_about_now/injectable/modules/tests_manager.dart' as _i10;
import 'package:how_about_now/presentation/pages/add_task/cubit/add_task_cubit.dart' as _i12;
import 'package:how_about_now/presentation/pages/home_page/cubit/home_cubit.dart' as _i17;
import 'package:how_about_now/presentation/theme/theme_manager.dart' as _i11;
import 'package:how_about_now/presentation/utils/router/app_router.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appRouterModule = _$AppRouterModule();
    final firebaseFirestoreModule = _$FirebaseFirestoreModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.lazySingleton<_i3.AppRouter>(() => appRouterModule.instance);
    gh.lazySingleton<_i4.FirebaseFirestore>(() => firebaseFirestoreModule.instance);
    await gh.factoryAsync<_i5.SharedPreferences>(
      () => sharedPreferencesModule.instance,
      preResolve: true,
    );
    gh.factory<_i6.TasksDataSource>(() => _i7.TasksDataSourceImpl(
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.SharedPreferences>(),
        ));
    gh.factory<_i8.TasksRepository>(() => _i9.TasksRepositoryImpl(gh<_i6.TasksDataSource>()));
    gh.lazySingleton<_i10.TestsManager>(() => _i10.TestsManager());
    gh.singleton<_i11.ThemeManager>(_i11.ThemeManager());
    gh.factory<_i12.AddTaskCubit>(() => _i12.AddTaskCubit(gh<_i8.TasksRepository>()));
    gh.factory<_i13.AuthenticationDataSource>(() => _i14.AuthenticationDataSourceImpl(
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.SharedPreferences>(),
        ));
    gh.factory<_i15.AuthenticationRepository>(
        () => _i16.AuthenticationRepositoryImpl(gh<_i13.AuthenticationDataSource>()));
    gh.factory<_i17.HomeCubit>(() => _i17.HomeCubit(gh<_i8.TasksRepository>()));
    gh.factory<_i18.AppCubit>(() => _i18.AppCubit(gh<_i15.AuthenticationRepository>()));
    return this;
  }
}

class _$AppRouterModule extends _i19.AppRouterModule {}

class _$FirebaseFirestoreModule extends _i20.FirebaseFirestoreModule {}

class _$SharedPreferencesModule extends _i21.SharedPreferencesModule {}
