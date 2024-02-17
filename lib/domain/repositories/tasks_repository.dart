import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/data/dto/task_dto.dart';

abstract class TasksRepository {
  Future<void> createTask(TaskDto dto);

  Future<List<TaskDto>> getTasks();

  Future<List<TaskCategoryDto>> getTasksCategories();

  Future<List<TaskDto>> getTasksByCategory(String category);

  Future<void> deleteTask(String id);
}
