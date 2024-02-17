import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/data/dto/task_dto.dart';

const String userId = '37b7e574-4228-4ef1-8b1b-99eff4a15d00';

final taskDtoV1 = TaskDto(
  id: '1',
  title: 'Test Task',
  category: 'General',
  color: '0xFF000080',
  date: DateTime(2025, 1, 10),
  isCompleted: false,
);

final taskDtoV2 = TaskDto(
  id: '2',
  title: 'Test Task2',
  category: 'Test Category2',
  color: '0xFF09af00',
  date: DateTime(2025, 1, 12),
  isCompleted: false,
);
final taskCategoryV1 = TaskCategoryDto(
  name: 'General',
  color: '0xFF000080',
  tasks: [taskDtoV1],
);
final taskCategoryV2 = TaskCategoryDto(
  name: 'Test Category2',
  color: '0xFF09af00',
  tasks: [taskDtoV2],
);
final taskCategoriesList = [taskCategoryV1, taskCategoryV2];
final tasksListV1 = [taskDtoV1, taskDtoV2];
