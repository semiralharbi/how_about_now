import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/injectable/injectable.dart';
import 'package:how_about_now/presentation/pages/add_task/cubit/add_task_cubit.dart';
import 'package:how_about_now/presentation/pages/add_task/widgets/date_picker_button.dart';
import 'package:how_about_now/presentation/pages/add_task/widgets/task_category_dropdown.dart';
import 'package:how_about_now/presentation/utils/enums/date_utils.dart';
import 'package:how_about_now/presentation/utils/enums/errors.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';
import 'package:how_about_now/presentation/widgets/custom_back_button.dart';
import 'package:how_about_now/presentation/widgets/custom_snackbar.dart';

@RoutePage()
class AddTaskPage extends StatelessWidget {
  const AddTaskPage({
    super.key,
    required this.categories,
    this.cubit,
  });

  final List<TaskCategoryDto> categories;
  final AddTaskCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit ?? getIt<AddTaskCubit>(),
      child: _Body(categories: categories),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({required this.categories});

  final List<TaskCategoryDto> categories;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  String _pickedDate = defaultDateFormat.format(DateTime.now());
  late final TextEditingController _taskTitleController;
  late TaskCategoryDto _selectedTaskCategory;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _taskTitleController = TextEditingController();
    _selectedTaskCategory = widget.categories.firstWhere(
      (category) => category.name == 'General',
      orElse: TaskCategoryDto.general,
    );
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) => state.whenOrNull(
          success: () {
            showCustomSnackBar(
              context,
              context.tr.addTaskPage_successSnackbar,
              isError: false,
            );
            context.router.pop(true);
            return;
          },
          error: (error) => showCustomSnackBar(context, error.errorText(context)),
        ),
        builder: (context, state) => Scaffold(
          floatingActionButton: state.maybeWhen(
            orElse: CircularProgressIndicator.new,
            loaded: () => ElevatedButton(
              onPressed: _onAddTaskPressed,
              child: Text(context.tr.addTaskPage_button),
            ).animate(delay: 200.ms).slideX(end: 0, begin: 2),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.maybeWhen(
                    orElse: () => const Gap(30),
                    loaded: CustomBackButton.new,
                  ),
                  const Spacer(),
                  TextFormField(
                    controller: _taskTitleController,
                    decoration: InputDecoration(
                      label: Text(
                        context.tr.addTaskPage_textFieldLabel,
                      ),
                    ),
                    validator: _onValidation,
                  ),
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DatePickerButton(
                        onDatePicked: (pickedDate) => setState(() => _pickedDate = pickedDate),
                        initialDate: _pickedDate,
                      ),
                      TaskCategoryDropdown(
                        categories: widget.categories,
                        onSelectedCategory: (category) {
                          setState(() => _selectedTaskCategory = category);
                        },
                      ),
                    ],
                  ).animate(delay: 300.ms).fadeIn(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      );

  void _onAddTaskPressed() {
    if (_formKey.currentState!.validate()) {
      context.read<AddTaskCubit>().createTask(
            title: _taskTitleController.text,
            category: _selectedTaskCategory.name,
            color: _selectedTaskCategory.color,
            date: DateTime.parse(_pickedDate),
          );
    }
  }

  String? _onValidation(String? value) {
    if (value == null || value.isEmpty) {
      return Errors.fieldCantBeEmpty.errorText(context);
    }
    return null;
  }
}
