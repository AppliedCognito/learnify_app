import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/theme/colors/app_colors.dart';
import 'package:learnify_app/features/profile/presentation/widgets/paper1_content.dart';
import 'package:learnify_app/features/profile/presentation/widgets/score_content.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScoreContent(),
            const Gap(16),

            Container(
              margin: context.paddingS,
              padding: context.paddingXS,
              decoration: BoxDecoration(
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF2D2D2D)
                        : const Color(0xffF2F2F2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : AppColors.black,
                labelStyle: context.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                dividerColor: Colors.transparent,
                tabs: const [Tab(text: 'Paper I'), Tab(text: 'Paper II')],
              ),
            ),

            const Gap(12),

            // Tab content view
            SizedBox(
              height: 350,
              child: const TabBarView(
                children: [PaperIContent(), Center(child: Text('Paper II'))],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
