import 'package:how_about_now/presentation/utils/global_imports.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    super.key,
    this.onTap,
    this.child,
  });

  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) => InkWell(
        splashColor: AppColors.primary300,
        splashFactory: InkSplash.splashFactory,
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: child,
      );
}
