import 'package:how_about_now/presentation/utils/global_imports.dart';
import 'package:how_about_now/presentation/widgets/custom_ink_well.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () => context.router.pop(),
      child: const Icon(
        Icons.arrow_back_rounded,
        size: 30,
        color: AppColors.primary600,
      ),
    );
  }
}
