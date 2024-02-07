import 'package:how_about_now/presentation/pages/add_task/widgets/task_category_dropdown.dart';
import 'package:how_about_now/presentation/utils/enums/date_utils.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';
import 'package:how_about_now/presentation/widgets/custom_ink_well.dart';
import 'package:how_about_now/presentation/widgets/date_picker.dart';

@RoutePage()
class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  String _pickedDate = defaultDateFormat.format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Text(context.tr.addTaskPage_button),
      ).animate(delay: 200.ms).slideX(end: 0, begin: 2),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInkWell(
              onTap: () => context.router.pop(),
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
                color: AppColors.primary600,
              ),
            ),
            const Spacer(),
            TextField(
              decoration: InputDecoration(
                label: Text(
                  context.tr.addTaskPage_textFieldLabel,
                ),
              ),
            ),
            const Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    final selectedDate = await showCalendarPicker(context);
                    if (selectedDate != null) setState(() => _pickedDate = defaultDateFormat.format(selectedDate));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.calendar_today_rounded,
                        size: 20,
                      ),
                      const Gap(10),
                      Text(
                        isToday(_pickedDate) ? context.tr.addTaskPage_today : _pickedDate,
                        style: context.tht.bodyLarge?.copyWith(color: AppColors.primary1000),
                      ),
                    ],
                  ),
                ),
                const TaskCategoryDropdown(),
              ],
            ).animate(delay: 300.ms).fadeIn(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
