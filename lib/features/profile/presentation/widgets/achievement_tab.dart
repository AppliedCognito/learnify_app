import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';

class AchievementTab extends StatelessWidget {
  const AchievementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: context.paddingS,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAchievementCard(
                context,
                'assets/images/start_test.png',
                'Ranked 1st',
              ),
              _buildAchievementCard(
                context,
                'assets/images/start_test.png',
                '100 Questions',
              ),
            ],
          ),
          const Gap(16),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(
    BuildContext context,
    String imagePath,
    String title,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 160,
      height: 160,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2D2D2D) : const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 80),
          const Gap(12),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: isDark ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
