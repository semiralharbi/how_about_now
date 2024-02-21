import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/data/dto/task_dto.dart';

abstract class TasksRepository {
  Future<void> createTask(TaskDto dto);

  Stream<List<TaskDto>> getTasks();

  Future<void> completeTask({required String id, required bool isCompleted});

  Future<List<TaskCategoryDto>> getTasksCategories();

  Stream<List<TaskDto>> getTasksByCategory(String category);

  Future<void> deleteTask(String id);
}
