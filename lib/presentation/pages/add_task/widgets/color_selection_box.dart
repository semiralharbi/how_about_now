import 'package:how_about_now/presentation/utils/enums/colors_utils.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';

class ColorSelectionBox extends StatelessWidget {
  const ColorSelectionBox({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          color: color,
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              spreadRadius: 0.5,
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: isSelected
            ? Icon(
                Icons.check,
                color: computeColorLuminance(color),
                size: 20,
              ).animate().scale()
            : null,
      ),
    );
  }
}
