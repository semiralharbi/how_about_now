import 'package:how_about_now/data/dto/task_dto.dart';

abstract class TasksDataSource {
  Future<void> createTask(TaskDto dto);

  Stream<List<TaskDto>> getTodayTasks();

  Stream<List<TaskDto>> getAllTasks();

  Future<void> completeTask({required String id, required bool isCompleted});

  Future<void> deleteTask(String id);

  Stream<List<TaskDto>> getTasksByCategory(String category);
}
