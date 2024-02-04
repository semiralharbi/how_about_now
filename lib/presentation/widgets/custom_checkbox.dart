import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.checkboxValue,
    this.height = 30,
    this.width = 30,
    this.iconSize = 18,
  });

  final bool checkboxValue;
  final double height;
  final double width;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary500, width: 2),
      ),
      child: checkboxValue
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.complementary800,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                Icons.check,
                color: AppColors.primary50,
                size: iconSize,
              ).animate().fadeIn(delay: 300.ms),
            ).animate().scale(curve: Curves.ease, duration: 400.ms)
          : const SizedBox.shrink(),
    );
  }
}
