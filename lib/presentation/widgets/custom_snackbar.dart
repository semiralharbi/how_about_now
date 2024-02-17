import 'package:flutter/material.dart';

import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:how_about_now/presentation/utils/enums/context_extensions.dart';

void showCustomSnackBar(
  BuildContext context,
  String text, {
  int? seconds,
  bool isError = true,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: seconds ?? 1),
      backgroundColor: isError ? AppColors.error : AppColors.complementary800,
      content: Text(
        text,
        style: context.tht.bodyLarge?.copyWith(color: AppColors.primary50),
      ),
    ),
  );
}
