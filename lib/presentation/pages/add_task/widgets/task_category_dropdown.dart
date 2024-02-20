import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/presentation/pages/add_task/widgets/add_task_category_dialog.dart';
import 'package:how_about_now/presentation/pages/add_task/widgets/dropdown_category_label.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';

class TaskCategoryDropdown extends StatefulWidget {
  const TaskCategoryDropdown({
    super.key,
    required this.categories,
    required this.onSelectedCategory,
  });

  final List<TaskCategoryDto> categories;
  final void Function(TaskCategoryDto) onSelectedCategory;

  @override
  TaskCategoryDropdownState createState() => TaskCategoryDropdownState();
}

class TaskCategoryDropdownState extends State<TaskCategoryDropdown> {
  late TaskCategoryDto _initialCategory;
  late List<TaskCategoryDto> _categories;

  @override
  void initState() {
    super.initState();
    _initializeCategories();
    _initialCategory = widget.categories.firstWhere((category) => category.isGeneralCategory);
  }

  void _initializeCategories() {
    _categories = List.from(widget.categories);
    _categories
      ..removeWhere((cat) => cat.isAllTasksCategory)
      ..removeWhere((cat) => cat.isTodayCategory);
  }

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: null,
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            const BorderSide(color: AppColors.primary1000),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<TaskCategoryDto>(
            iconSize: 0,
            isDense: true,
            menuMaxHeight: 200,
            borderRadius: BorderRadius.circular(16),
            hint: DropdownCategoryLabel(
              selectedCategory: _initialCategory.name,
              selectedColor: Color(int.parse(_initialCategory.color)),
            ),
            value: _initialCategory,
            items: [
              DropdownMenuItem<TaskCategoryDto>(
                value: TaskCategoryDto.empty(),
                child: Row(
                  children: [
                    const Icon(Icons.add, color: AppColors.primary1000),
                    const Gap(10),
                    Text(
                      context.tr.generic_new,
                      style: context.tht.bodyLarge?.copyWith(color: AppColors.primary900),
                    ),
                  ],
                ),
              ),
              ..._categories.map<DropdownMenuItem<TaskCategoryDto>>((TaskCategoryDto value) {
                return DropdownMenuItem<TaskCategoryDto>(
                  value: value,
                  child: DropdownCategoryLabel(
                    selectedCategory: value.name,
                    selectedColor: Color(int.parse(value.color)),
                  ),
                );
              }),
            ],
            onChanged: _onChanged,
          ),
        ),
      );

  void _onChanged(TaskCategoryDto? newValue) {
    if (newValue != null) {
      if (newValue.name.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AddTaskCategoryDialog(
            onAddTap: (category, color) {
              final createdCategory = TaskCategoryDto(name: category, color: color, tasks: []);
              setState(() {
                _categories.add(createdCategory);
                _initialCategory = createdCategory;
                widget.onSelectedCategory(_initialCategory);
              });
            },
          ),
        );
        return;
      }
      setState(() {
        _initialCategory = newValue;
        widget.onSelectedCategory(_initialCategory);
      });
    }
  }
}
