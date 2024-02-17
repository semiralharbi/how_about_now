import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onTap,
    required this.activeIndex,
    this.gapLocation = GapLocation.center,
    required this.icons,
  });

  final void Function(int) onTap;
  final int activeIndex;
  final GapLocation gapLocation;
  final List<IconData> icons;

  @override
  Widget build(BuildContext context) => AnimatedBottomNavigationBar(
        icons: icons,
        shadow: const Shadow(
          blurRadius: 6,
          offset: Offset(0, -1),
        ),
        backgroundColor: AppColors.primary300,
        activeColor: AppColors.primary50,
        splashColor: AppColors.primary400,
        inactiveColor: AppColors.primary1000,
        splashRadius: 30,
        iconSize: 28,
        activeIndex: activeIndex,
        gapLocation: gapLocation,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        onTap: onTap,
      );
}
