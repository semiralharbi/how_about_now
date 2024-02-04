import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:how_about_now/presentation/utils/enums/context_extensions.dart';
import 'package:how_about_now/presentation/widgets/custom_checkbox.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({super.key});

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  bool _checkboxValue = false;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Material(
          elevation: 2,
          shape: const StadiumBorder(),
          child: ListTile(
            onTap: () {
              setState(() {
                _checkboxValue = !_checkboxValue;
              });
            },
            contentPadding: const EdgeInsets.only(left: 12),
            leading: CustomCheckbox(checkboxValue: _checkboxValue),
            title: Text(
              'Wash the dishes',
              style: context.tht.labelMedium?.copyWith(
                decoration: _checkboxValue ? TextDecoration.lineThrough : null,
              ),
            ),
            splashColor: AppColors.primary200,
            tileColor: AppColors.primary100,
            shape: const StadiumBorder(),
          ),
        ),
      ).animate().slideX(duration: 300.ms, begin: -1);
}
