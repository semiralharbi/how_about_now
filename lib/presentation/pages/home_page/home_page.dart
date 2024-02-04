import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:how_about_now/presentation/pages/home_page/widgets/minimized_task_category_card.dart';
import 'package:how_about_now/presentation/pages/home_page/widgets/task_category_card.dart';
import 'package:how_about_now/presentation/pages/home_page/widgets/task_list_tile.dart';
import 'package:how_about_now/presentation/theme/app_colors.dart';
import 'package:how_about_now/presentation/utils/enums/context_extensions.dart';
import 'package:how_about_now/presentation/widgets/custom_bottom_navigation_bar.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeTabIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 28,
          ),
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
      if (_scrollController.offset > 80) {
        setState(() => _minimizeCategories = true);
      } else {
        setState(() => _minimizeCategories = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double textScaleFactor = context.mq.textScaleFactor;

    const double baseHeight = 160;
    const double baseCollapsedHeight = 100;
    final double adjustedHeight = baseHeight + (textScaleFactor - 1) * 60;
    final double adjustedCollapsedHeight = baseCollapsedHeight + (textScaleFactor - 1) * 80;

    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          elevation: 0,
          scrolledUnderElevation: 2,
          backgroundColor: AppColors.primary50,
          pinned: true,
          expandedHeight: adjustedHeight,
          collapsedHeight: adjustedCollapsedHeight,
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
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) =>
                        _minimizeCategories ? const MinimizedTaskCategoryCard() : const TaskCategoryCard(),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(height: 20),
                Text(
                  context.tr.homePage_todayTasks(10),
                  style: context.tht.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
            (_, index) => const TaskListTile(),
          ),
        ),
      ],
    );
  }
}
