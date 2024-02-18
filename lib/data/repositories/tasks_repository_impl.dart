import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/data/dto/task_dto.dart';
import 'package:how_about_now/domain/data_source/tasks_data_source.dart';
import 'package:how_about_now/domain/repositories/tasks_repository.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:how_about_now/presentation/utils/enums/date_utils.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TasksRepository)
class TasksRepositoryImpl implements TasksRepository {
  TasksRepositoryImpl(this._tasksDataSource);

  final TasksDataSource _tasksDataSource;

  @override
  Future<void> createTask(TaskDto dto) async {
    try {
      await _tasksDataSource.createTask(dto);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await _tasksDataSource.deleteTask(id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<TaskDto>> getTasks() async {
    try {
      return _tasksDataSource.getTasks();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<TaskDto>> getTasksByCategory(String category) {
    try {
      return _tasksDataSource.getTasksByCategory(category);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<TaskCategoryDto>> getTasksCategories() async {
    try {
      final allTasks = await _tasksDataSource.getTasks();

      final List<TaskCategoryDto> categoriesList = [];

      for (final task in allTasks) {
        final category = task.category;

        final existingCategoryIndex = categoriesList.indexWhere((cat) => cat.name == category);

        if (existingCategoryIndex != -1) {
          final existingCategory = categoriesList[existingCategoryIndex];
          final updatedTasks = [...existingCategory.tasks, task];
          final updatedCategory = existingCategory.copyWith(tasks: updatedTasks);
          categoriesList[existingCategoryIndex] = updatedCategory;
        } else {
          final newCategory = TaskCategoryDto(
            name: category,
            color: task.color,
            tasks: [task],
          );
          categoriesList.add(newCategory);
        }
      }
      final containsGeneral = allTasks.any((task) => task.hasGeneralCategory);
      if (!containsGeneral) {
        categoriesList.insert(
          0,
          const TaskCategoryDto(name: 'General', tasks: [], color: AppColorsStrings.analogous700),
        );
      }
      categoriesList
        ..sort((a, b) => a.name.compareTo(b.name))
        ..insert(0, TaskCategoryDto(name: 'All Tasks', tasks: allTasks, color: AppColorsStrings.primary300));

      final todayTasks = allTasks.where((task) => isToday(task.date.toIso8601String())).toList();
      if (todayTasks.isNotEmpty) {
        categoriesList.insert(0, TaskCategoryDto(name: 'Today', tasks: todayTasks, color: AppColorsStrings.triadic800));
      }

      return categoriesList;
    } catch (e) {
      rethrow;
    }
  }
}
