import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';

class LinearPercentIndicator extends StatelessWidget {
  const LinearPercentIndicator({super.key, required this.percent});

  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary50,
        borderRadius: BorderRadius.circular(28),
      ),
      child: const ColoredBox(
        color: AppColors.complementary800,
      ).animate().slideX(duration: 500.ms, begin: -1, end: (percent * 1) - 1),
    );
  }
}
