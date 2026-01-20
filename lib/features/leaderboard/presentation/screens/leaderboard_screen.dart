import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/constants/app_constants.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/theme/colors/app_colors.dart';
import 'package:learnify_app/features/leaderboard/presentation/widgets/common_profile_widget.dart';
import 'package:learnify_app/features/leaderboard/presentation/widgets/leaderboard_list.dart';

// Leaderboard screen with tabs and top users list.
class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF1E1E1E)
                : AppColors.primary,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(160),
          child: Container(
            padding: context.paddingTopSafe,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Leaderboard',
                  style: context.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(20),
                Container(
                  height: 40,
                  margin: context.paddingHorizontal,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF2D2D2D)
                            : const Color(0xFF4E40BD),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.transparent,
                    labelColor: AppColors.primary,
                    unselectedLabelColor: Colors.white,
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    dividerColor: Colors.transparent,
                    tabs: const [Tab(text: 'Weekly'), Tab(text: 'All Time')],
                  ),
                ),
              ],
            ),
          ),
        ),

        body: Column(
          children: [
            //  Fixed user card (below tab bar)
            Container(
              padding: context.paddingHorizontal,
              child: CommonProfileWidget(
                isHighlight: true,
                name: 'Muhammed Rafsal N',
                rank: 25,
                points: 1250,
              ),
            ),

            Expanded(
              child: Container(
                // padding: context.paddingHorizontal,
                margin: const EdgeInsets.only(
                  top: AppConstants.leaderboardTopPadding,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: TabBarView(
                    children: [
                      LeaderboardList(tabName: 'Weekly'),
                      LeaderboardList(tabName: 'All Time'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
