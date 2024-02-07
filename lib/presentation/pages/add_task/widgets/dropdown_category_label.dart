import 'package:how_about_now/presentation/utils/global_imports.dart';

class DropdownCategoryLabel extends StatelessWidget {
  const DropdownCategoryLabel({
    super.key,
    this.selectedCategory,
    required this.selectedColor,
  });

  final String? selectedCategory;
  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: 20,
          color: selectedColor ?? AppColors.primary1000,
        ),
        const Gap(10),
        Text(
          selectedCategory ?? context.tr.addTaskPage_generalGroup,
          style: context.tht.bodyLarge?.copyWith(color: AppColors.primary1000),
        ),
      ],
    );
  }
}
