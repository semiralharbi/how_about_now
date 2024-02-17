import 'package:how_about_now/data/dto/task_dto.dart';

abstract class TasksDataSource {
  Future<void> createTask(TaskDto dto);

  Future<List<TaskDto>> getTasks();

  Future<void> deleteTask(String id);

  Future<List<TaskDto>> getTasksByCategory(String category);
}
