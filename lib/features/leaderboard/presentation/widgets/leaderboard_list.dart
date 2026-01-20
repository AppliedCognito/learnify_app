import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/providers/database_provider.dart';
import 'package:learnify_app/features/leaderboard/presentation/widgets/common_profile_widget.dart';

class LeaderboardList extends ConsumerWidget {
  final String tabName;

  const LeaderboardList({super.key, required this.tabName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the appropriate leaderboard based on tab
    final leaderboard =
        tabName == 'Weekly'
            ? ref.watch(weeklyLeaderboardProvider)
            : ref.watch(allTimeLeaderboardProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(12),
          ListView.builder(
            padding: context.paddingBottomSafe,
            shrinkWrap: true,
            itemCount: leaderboard.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final entry = leaderboard[index];
              return Padding(
                padding: context.paddingHorizontal,
                child: CommonProfileWidget(
                  backgroundColor: const Color(0xFFF2F2F2),
                  name: entry.name,
                  rank: entry.rank,
                  points: entry.points,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
