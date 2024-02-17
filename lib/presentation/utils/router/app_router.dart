import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/presentation/pages/add_task/add_task_page.dart';
import 'package:how_about_now/presentation/pages/add_task/cubit/add_task_cubit.dart';
import 'package:how_about_now/presentation/pages/home_page/cubit/home_cubit.dart';
import 'package:how_about_now/presentation/pages/home_page/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: AddTaskRoute.page),
      ];
}
