import 'package:how_about_now/presentation/pages/home_page/cubit/home_cubit.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';
import 'package:how_about_now/presentation/widgets/linear_percent_indicator.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TaskCategoryCard extends StatelessWidget {
  factory TaskCategoryCard.skeleton() => const TaskCategoryCard(
        title: 'Some title',
        color: '0xFFd4bff9',
        completedCount: 0,
        tasksCount: 0,
      );

  const TaskCategoryCard({
    super.key,
    required this.title,
    required this.color,
    required this.completedCount,
    required this.tasksCount,
  });

  final String title;
  final String color;
  final int completedCount;
  final int tasksCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<HomeCubit>().getTasksByCategory(title),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 3,
        color: Color(int.parse(color)),
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
                      title,
                      style: context.tht.bodyLarge?.copyWith(
                        color: AppColors.primary50,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ).animate().fadeIn(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr.homePage_doneTasks(completedCount, tasksCount),
                      style: context.tht.bodyMedium?.copyWith(
                        color: AppColors.primary50,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(6),
                    Skeleton.leaf(
                      child: LinearPercentIndicator(percent: completedCount / tasksCount),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
