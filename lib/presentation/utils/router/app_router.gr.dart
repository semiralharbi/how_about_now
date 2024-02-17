// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddTaskRoute.name: (routeData) {
      final args = routeData.argsAs<AddTaskRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddTaskPage(
          key: args.key,
          categories: args.categories,
          cubit: args.cubit,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          cubit: args.cubit,
        ),
      );
    },
  };
}

/// generated route for
/// [AddTaskPage]
class AddTaskRoute extends PageRouteInfo<AddTaskRouteArgs> {
  AddTaskRoute({
    Key? key,
    required List<TaskCategoryDto> categories,
    AddTaskCubit? cubit,
    List<PageRouteInfo>? children,
  }) : super(
          AddTaskRoute.name,
          args: AddTaskRouteArgs(
            key: key,
            categories: categories,
            cubit: cubit,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTaskRoute';

  static const PageInfo<AddTaskRouteArgs> page = PageInfo<AddTaskRouteArgs>(name);
}

class AddTaskRouteArgs {
  const AddTaskRouteArgs({
    this.key,
    required this.categories,
    this.cubit,
  });

  final Key? key;

  final List<TaskCategoryDto> categories;

  final AddTaskCubit? cubit;

  @override
  String toString() {
    return 'AddTaskRouteArgs{key: $key, categories: $categories, cubit: $cubit}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    HomeCubit? cubit,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            cubit: cubit,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<HomeRouteArgs> page = PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.cubit,
  });

  final Key? key;

  final HomeCubit? cubit;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, cubit: $cubit}';
  }
}
