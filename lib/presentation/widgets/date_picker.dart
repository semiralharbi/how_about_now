import 'package:flutter/material.dart';
import 'package:how_about_now/injectable/injectable.dart';
import 'package:how_about_now/injectable/modules/tests_manager.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:how_about_now/presentation/utils/enums/context_extensions.dart';

Future<DateTime?> showCalendarPicker(
  BuildContext context,
) async =>
    showDatePicker(
      context: context,
      initialDate: getIt<TestsManager>().duringTestExecution ? DateTime(2060) : DateTime.now(),
      locale: Localizations.localeOf(context),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (_, child) {
        return Theme(
          data: context.th.copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary700,
              onPrimary: AppColors.primary50,
              surface: AppColors.primary50,
              onSurface: AppColors.primary700,
              surfaceTint: AppColors.primary100,
            ),
          ),
          child: FractionallySizedBox(
            heightFactor: 0.7,
            child: child,
          ),
        );
      },
    );
