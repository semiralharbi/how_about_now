import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';

class LinearPercentIndicator extends StatefulWidget {
  const LinearPercentIndicator({super.key, required this.percent});

  final double percent;

  @override
  State<LinearPercentIndicator> createState() => _LinearPercentIndicatorState();
}

class _LinearPercentIndicatorState extends State<LinearPercentIndicator> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  double _lastAnimatedPercent = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: 500.ms);
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _animation = Tween<double>(begin: _lastAnimatedPercent, end: widget.percent).animate(_animationController)
      ..addListener(() => setState(() {}));
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant LinearPercentIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent) {
      _animation = Tween<double>(begin: _lastAnimatedPercent, end: widget.percent).animate(_animationController)
        ..addListener(() => setState(() {}));
      _animationController
        ..reset()
        ..forward();
      _lastAnimatedPercent = widget.percent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final maxWidth = constraints.maxWidth;
        final barWidth = maxWidth * (_animation.value.clamp(0.0, 1.0));

        return Container(
          clipBehavior: Clip.hardEdge,
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primary50,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: barWidth,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.complementary800,
                borderRadius: BorderRadius.horizontal(right: Radius.circular(28)),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
