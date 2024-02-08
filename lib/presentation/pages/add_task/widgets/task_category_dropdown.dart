import 'package:how_about_now/presentation/pages/add_task/widgets/add_task_category_dialog.dart';
import 'package:how_about_now/presentation/pages/add_task/widgets/dropdown_category_label.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';

class TaskCategoryDropdown extends StatefulWidget {
  const TaskCategoryDropdown({super.key});

  @override
  TaskCategoryDropdownState createState() => TaskCategoryDropdownState();
}

class TaskCategoryDropdownState extends State<TaskCategoryDropdown> {
  //TODO: remove later
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'General',
      'color': 0xFF000080,
    },
    {
      'title': 'Work',
      'color': 0xFF0000d6,
    },
    {
      'title': 'Office',
      'color': 0xFFd602ee,
    },
    {
      'title': 'Example',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
    {
      'title': 'Expaple',
      'color': 0xFF09af00,
    },
  ];
  Map<String, dynamic>? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: null,
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          const BorderSide(color: AppColors.primary1000),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Map<String, dynamic>>(
          iconSize: 0,
          isDense: true,
          menuMaxHeight: 200,
          borderRadius: BorderRadius.circular(16),
          hint: DropdownCategoryLabel(
            selectedCategory: selectedCategory?['title'],
            selectedColor: Color(selectedCategory?['color'] ?? 0xFF000080),
          ),
          value: selectedCategory,
          items: [
            DropdownMenuItem<Map<String, dynamic>>(
              value: const {'add_category': true},
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
            ...categories.map<DropdownMenuItem<Map<String, dynamic>>>((Map<String, dynamic> value) {
              return DropdownMenuItem<Map<String, dynamic>>(
                value: value,
                child: DropdownCategoryLabel(
                  selectedCategory: value['title'],
                  selectedColor: Color(value['color'] ?? 0xFF000080),
                ),
              );
            }),
          ],
          onChanged: (Map<String, dynamic>? newValue) {
            if (newValue?['add_category'] == true) {
              showDialog(
                context: context,
                builder: (context) => const AddTaskCategoryDialog(),
              );
              return;
            }
            setState(() {
              selectedCategory = newValue;
            });
          },
        ),
      ),
    );
  }
}
