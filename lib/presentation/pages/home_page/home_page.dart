import 'package:how_about_now/data/dto/task_category_dto.dart';
import 'package:how_about_now/injectable/injectable.dart';
import 'package:how_about_now/presentation/pages/home_page/cubit/home_cubit.dart';
import 'package:how_about_now/presentation/pages/home_page/widgets/minimized_task_category_card.dart';
import 'package:how_about_now/presentation/pages/home_page/widgets/task_category_card.dart';
import 'package:how_about_now/presentation/pages/home_page/widgets/task_list_tile.dart';
import 'package:how_about_now/presentation/utils/global_imports.dart';
import 'package:how_about_now/presentation/utils/router/app_router.dart';
import 'package:how_about_now/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key, this.cubit});

  final HomeCubit? cubit;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeTabIndex = 0;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => widget.cubit ?? getIt<HomeCubit>()
          ..getTasks(),
        child: Scaffold(
          floatingActionButton: BlocSelector<HomeCubit, HomeState, List<TaskCategoryDto>>(
            selector: (state) => state.maybeWhen(
              orElse: () => [],
              loaded: (_, categories) => categories,
            ),
            builder: (context, categories) {
              return FloatingActionButton(
                onPressed: () async {
                  final result = await context.router.push(AddTaskRoute(categories: categories)) as bool? ?? false;
                  if (result && mounted) {
                    await context.read<HomeCubit>().getTasks();
                  }
                },
                child: const Icon(Icons.add, size: 28),
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomBottomNavigationBar(
            onTap: (index) {
              setState(() {
                _activeTabIndex = index;
              });
            },
            activeIndex: _activeTabIndex,
            icons: const [
              Icons.access_time_rounded,
              Icons.home_outlined,
            ],
          ),
          body: const _Body(),
        ),
      );
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final ScrollController _scrollController;
  bool _minimizeCategories = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 40) {
        setState(() => _minimizeCategories = true);
      } else {
        setState(() => _minimizeCategories = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = context.mq.textScaler.scale(1);

    const double _baseHeight = 160;
    const double _baseCollapsedHeight = 100;
    final double _appBarExpandedHeight = _baseHeight + (textScaleFactor - 1) * 60;
    final double _appBarCollapsedHeight = _baseCollapsedHeight + (textScaleFactor - 1) * 80;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            scrolledUnderElevation: 2,
            backgroundColor: AppColors.primary50,
            pinned: true,
            expandedHeight: _appBarExpandedHeight,
            collapsedHeight: _appBarCollapsedHeight,
            flexibleSpace: SafeArea(
              minimum: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr.homePage_categories,
                    style: context.tht.bodyLarge,
                  ),
                  const Gap(12),
                  Expanded(
                    child: state.maybeWhen(
                      orElse: () => Skeletonizer(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 6),
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (_, __) => TaskCategoryCard.skeleton(),
                        ),
                      ),
                      loaded: (_, categories) => ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          final category = categories[index];
                          final completedTasksCount = category.completedTasks;
                          return _minimizeCategories
                              ? MinimizedTaskCategoryCard(color: category.color, title: category.name)
                              : TaskCategoryCard(
                                  title: category.name,
                                  color: category.color,
                                  completedCount: completedTasksCount,
                                  tasksCount: category.tasks.length,
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocSelector<HomeCubit, HomeState, String>(
            selector: (state) => state.maybeWhen(
              orElse: () => '',
              loaded: (tasks, _) => '${tasks.length}',
            ),
            builder: (context, tasksAmount) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(height: 20),
                      Text(
                        context.tr.homePage_todayTasks(tasksAmount),
                        style: context.tht.bodyLarge,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          state.maybeWhen(
            orElse: () => const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
            loaded: (tasks, _) => SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: tasks.length,
                (_, index) => TaskListTile(task: tasks[index]),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: Gap(100)),
        ],
      ),
    );
  }
}
