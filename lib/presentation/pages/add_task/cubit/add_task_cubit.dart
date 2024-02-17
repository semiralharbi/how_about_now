import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:how_about_now/data/dto/task_dto.dart';
import 'package:how_about_now/domain/repositories/tasks_repository.dart';
import 'package:how_about_now/domain/utils/exception.dart';
import 'package:how_about_now/presentation/utils/enums/errors.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

part 'add_task_state.dart';

part 'add_task_cubit.freezed.dart';

@injectable
class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this._tasksRepository) : super(const AddTaskState.loaded());

  final TasksRepository _tasksRepository;

  Future<void> createTask({
    required String title,
    required String category,
    required String color,
    required DateTime date,
  }) async {
    emit(const AddTaskState.loading());
    try {
      await _tasksRepository.createTask(
        TaskDto(
          id: const Uuid().v4(),
          title: title,
          category: category,
          color: color,
          date: date,
          isCompleted: false,
        ),
      );
      return emit(const AddTaskState.success());
    } on ApiException catch (e) {
      emit(AddTaskState.error(e.error));
    }
  }
}
