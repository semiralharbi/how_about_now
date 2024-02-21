import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/data/dto/task_dto.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';

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

final taskDtoV3 = TaskDto(
  id: '3',
  title: 'Test Task',
  category: 'Test Category3',
  color: '0xFF000080',
  date: DateTime(2025, 1, 10),
  isCompleted: false,
);

final taskDtoV4 = TaskDto(
  id: '4',
  title: 'Test Task',
  category: 'Test Category4',
  color: '0xFF000080',
  date: DateTime(2025, 1, 10),
  isCompleted: false,
);

final taskDtoV5 = TaskDto(
  id: '5',
  title: 'Test Task',
  category: 'General',
  color: '0xFF000080',
  date: DateTime(2025, 1, 10),
  isCompleted: false,
);

final completedTaskDtoV1 = TaskDto(
  id: '1',
  title: 'Test Task',
  category: 'General',
  color: '0xFF000080',
  date: DateTime(2025, 1, 10),
  isCompleted: true,
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

final taskForToday = TaskDto(
  id: '11',
  title: 'Task for today',
  date: DateTime.now(),
  category: 'Work',
  color: AppColorsStrings.primary500,
  isCompleted: false,
);

final taskCategoriesList = [taskCategoryV1, taskCategoryV2];
final tasksListV1 = [taskDtoV1, taskDtoV2];
final tasksLongListV1 = [
  taskDtoV1,
  taskDtoV2,
  taskDtoV3,
  taskDtoV4,
  taskDtoV5,
  taskForToday,
];
