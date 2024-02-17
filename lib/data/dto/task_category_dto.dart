import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:how_about_now/data/dto/task_dto.dart';

part 'task_category_dto.freezed.dart';

@freezed
class TaskCategoryDto with _$TaskCategoryDto {
  const TaskCategoryDto._();

  const factory TaskCategoryDto({
    required String name,
    required String color,
    required List<TaskDto> tasks,
  }) = _TaskCategoryDto;

  factory TaskCategoryDto.empty() => const TaskCategoryDto(
        name: '',
        color: '0xFF09af00',
        tasks: [],
      );

  factory TaskCategoryDto.general() => const TaskCategoryDto(
        name: 'General',
        color: '0xFF021aee',
        tasks: [],
      );

  int get completedTasks => tasks.where((task) => task.isCompleted).length;
}
