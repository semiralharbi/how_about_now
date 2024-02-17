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

  Future<void> getTasks() async {
    emit(const HomeState.loading());
    try {
      final tasks = await _tasksRepository.getTasks();
      final categories = await _tasksRepository.getTasksCategories();
      emit(HomeState.loaded(tasks: tasks, categories: categories));
    } on ApiException catch (e) {
      emit(HomeState.error(e.error));
    }
  }
}
