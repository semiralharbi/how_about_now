import 'dart:math';
import 'package:flutter/material.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';

Color get generateRandomColor {
  final Random random = Random();

  final int r = random.nextInt(256);
  final int g = random.nextInt(256);
  final int b = random.nextInt(256);

  return Color.fromRGBO(r, g, b, 1);
}

List<int> generateRandomColors(int count) {
  final Random random = Random();
  final List<int> colors = [];
  for (int i = 0; i < count; i++) {
    const int alpha = 0xFF << 24;
    final int rgb = random.nextInt(0xFFFFFF);
    final int color = alpha | rgb;
    colors.add(color);
  }
  return colors;
}

Color computeColorLuminance(Color color) {
  final double luminance = color.computeLuminance();

  return luminance > 0.5 ? AppColors.primary1000 : AppColors.primary50;
}
