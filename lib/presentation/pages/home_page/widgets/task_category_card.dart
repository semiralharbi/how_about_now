import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:how_about_now/presentation/pages/home_page/home_page.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:how_about_now/presentation/utils/enums/context_extensions.dart';
import 'package:how_about_now/presentation/widgets/linear_percent_indicator.dart';

class TaskCategoryCard extends StatelessWidget {
  const TaskCategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      color: AppColors.primary500,
      margin: const EdgeInsets.only(right: 10, bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          width: 136,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Professional',
                    style: context.tht.bodyMedium?.copyWith(
                      color: AppColors.primary50,
                      fontWeight: FontWeight.w600,
                    ),
                  ).animate().fadeIn(),
                  Text(
                    'Done: 0/10',
                    style: context.tht.bodySmall?.copyWith(
                      color: AppColors.primary50,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const LinearPercentIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}