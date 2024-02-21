import 'package:how_about_now/data/dto/task_dto.dart';
import 'package:how_about_now/presentation/pages/home_page/cubit/home_cubit.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';
import 'package:how_about_now/presentation/widgets/custom_checkbox.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({super.key, required this.task});

  final TaskDto task;

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = context.watch<HomeCubit>().state.whenOrNull(
              loaded: (tasks, _, __) => tasks.firstWhere((cubitTask) => cubitTask.id == widget.task.id).isCompleted,
            ) ??
        false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Material(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          onTap: () => context.read<HomeCubit>().completeTask(taskId: widget.task.id, isCompleted: !isCompleted),
          contentPadding: const EdgeInsets.only(left: 12),
          leading: CustomCheckbox(checkboxValue: isCompleted),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.task.title,
                style: context.tht.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              const Divider(color: AppColors.primary300, thickness: 0.5),
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                _controller
                  ..forward()
                  ..addListener(() {
                    if (_controller.isCompleted) {
                      context.read<HomeCubit>().deleteTask(widget.task.id);
                    }
                  });
              },
            ),
          ),
          subtitle: Text(context.tr.homePage_taskCategory(widget.task.category)),
          subtitleTextStyle: context.tht.bodyMedium?.copyWith(color: AppColors.primary500),
          splashColor: AppColors.primary300,
          tileColor: AppColors.primary100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    ).animate(controller: _controller, autoPlay: false).slideX(begin: 0, end: -1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
