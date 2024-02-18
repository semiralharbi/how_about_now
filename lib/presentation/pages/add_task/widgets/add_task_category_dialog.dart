import 'package:how_about_now/injectable/injectable.dart';
import 'package:how_about_now/injectable/modules/tests_manager.dart';
import 'package:how_about_now/presentation/pages/add_task/widgets/color_selection_box.dart';
import 'package:how_about_now/presentation/utils/enums/colors_utils.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';

class AddTaskCategoryDialog extends StatefulWidget {
  const AddTaskCategoryDialog({
    super.key,
    required this.onAddTap,
  });

  final void Function(String addedCategory, String color) onAddTap;

  @override
  State<AddTaskCategoryDialog> createState() => _AddTaskCategoryDialogState();
}

class _AddTaskCategoryDialogState extends State<AddTaskCategoryDialog> {
  final List<Color> _randomColors = generateRandomColors(6).map(Color.new).toList();
  final TextEditingController _controller = TextEditingController();
  final int _maxLength = 10;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = _randomColors.first;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _controller,
              maxLength: _maxLength,
              decoration: InputDecoration(
                labelText: getIt<TestsManager>().duringTestExecution
                    ? 'Enter new category name'
                    : context.tr.addTaskCategory_textFieldLabel,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  ..._randomColors.map(
                    (color) => ColorSelectionBox(
                      color: color,
                      isSelected: _selectedColor == color,
                      onTap: () => setState(() => _selectedColor = color),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onAddTap(_controller.text, _selectedColor.value.toString());
                    context.router.pop();
                  },
                  child: Text(
                    getIt<TestsManager>().duringTestExecution ? 'Add' : context.tr.generic_add,
                  ),
                ),
              ).delay300FadeIn,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
