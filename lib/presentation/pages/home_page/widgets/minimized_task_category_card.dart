import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:how_about_now/presentation/utils/enums/context_extensions.dart';

class MinimizedTaskCategoryCard extends StatelessWidget {
  const MinimizedTaskCategoryCard({super.key, required this.title, required this.color});

  final String title;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Color(int.parse(color)),
      margin: const EdgeInsets.only(right: 10, bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: 136,
          child: Center(
            child: Text(
              title,
              style: context.tht.bodyMedium?.copyWith(
                color: AppColors.primary50,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(),
          ),
        ),
      ),
    );
  }
}
