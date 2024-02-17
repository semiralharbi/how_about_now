import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:how_about_now/data/dto/task_dto.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:how_about_now/presentation/utils/enums/context_extensions.dart';
import 'package:how_about_now/presentation/widgets/custom_checkbox.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({super.key, required this.task});

  final TaskDto task;

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  late bool _checkboxValue;

  @override
  void initState() {
    super.initState();
    _checkboxValue = widget.task.isCompleted;
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Material(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            onTap: () {
              setState(() {
                _checkboxValue = !_checkboxValue;
              });
            },
            contentPadding: const EdgeInsets.only(left: 12),
            leading: CustomCheckbox(checkboxValue: _checkboxValue),
            title: Text(
              widget.task.title,
              style: context.tht.labelMedium?.copyWith(
                decoration: _checkboxValue ? TextDecoration.lineThrough : null,
              ),
            ),
            splashColor: AppColors.primary300,
            tileColor: AppColors.primary100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ).animate().slideX(duration: 300.ms, begin: -1);
}
