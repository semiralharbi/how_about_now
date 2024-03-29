import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/data/dto/task_dto.dart';
import 'package:how_about_now/domain/repositories/tasks_repository.dart';
import 'package:how_about_now/domain/utils/exception.dart';
import 'package:how_about_now/presentation/utils/enums/errors.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';

part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._tasksRepository) : super(const HomeState.loading());

  final TasksRepository _tasksRepository;
  StreamSubscription<List<TaskDto>>? _subscription;

  Future<void> getTasks() async {
    await _subscription?.cancel();
    emit(const HomeState.loading());
    try {
      _subscription = _tasksRepository.getTasks().listen((tasks) async {
        try {
          final categories = await _tasksRepository.getTasksCategories();
          emit(HomeState.loaded(tasks: tasks, categories: categories, selectedCategory: 'Today'));
        } on ApiException catch (e) {
          emit(HomeState.error(e.error));
        }
      });
    } on ApiException catch (e) {
      emit(HomeState.error(e.error));
    }
  }

  Future<void> completeTask({required String taskId, required bool isCompleted}) async {
    try {
      await _tasksRepository.completeTask(id: taskId, isCompleted: isCompleted);
    } on ApiException catch (e) {
      emit(HomeState.error(e.error));
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _tasksRepository.deleteTask(taskId);
    } on ApiException catch (e) {
      emit(HomeState.error(e.error));
    }
  }

  Future<void> getTasksByCategory(String category) async {
    await _subscription?.cancel();
    try {
      _subscription = _tasksRepository.getTasksByCategory(category).listen((tasks) async {
        try {
          final categories = await _tasksRepository.getTasksCategories();
          emit(HomeState.loaded(tasks: tasks, categories: categories, selectedCategory: category));
        } on ApiException catch (e) {
          emit(HomeState.error(e.error));
        }
      });
    } on ApiException catch (e) {
      emit(HomeState.error(e.error));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
