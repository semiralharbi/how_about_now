import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:how_about_now/data/dto/task_dto.dart';
import 'package:how_about_now/presentation/pages/home_page/cubit/home_cubit.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:how_about_now/presentation/utils/enums/context_extensions.dart';
import 'package:how_about_now/presentation/widgets/custom_checkbox.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key, required this.task});

  final TaskDto task;

  @override
  Widget build(BuildContext context) {
    final isCompleted = context.watch<HomeCubit>().state.whenOrNull(
              loaded: (tasks, _) => tasks.firstWhere((cubitTask) => cubitTask.id == task.id).isCompleted,
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
          onTap: () => context.read<HomeCubit>().completeTask(taskId: task.id, isCompleted: !isCompleted),
          contentPadding: const EdgeInsets.only(left: 12),
          leading: CustomCheckbox(checkboxValue: isCompleted),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
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
              onPressed: () => context.read<HomeCubit>().deleteTask(task.id),
            ),
          ),
          subtitle: Text(context.tr.homePage_taskCategory(task.category)),
          subtitleTextStyle: context.tht.bodyMedium?.copyWith(color: AppColors.primary500),
          splashColor: AppColors.primary300,
          tileColor: AppColors.primary100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    ).animate().slideX(duration: 300.ms, begin: -1);
  }
}
