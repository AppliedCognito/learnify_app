// quiz onboarding screen
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/theme/colors/app_colors.dart';
import 'package:learnify_app/features/quiz/presentation/widgets/paper_selection_box.dart';
import 'package:learnify_app/presentation/widgets/common_appbar.dart';
import 'package:learnify_app/presentation/widgets/common_button.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/routes/router_constants.dart';

class QuizOnboardingScreen extends StatelessWidget {
  const QuizOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [const CommonAppbar()],
        body: SingleChildScrollView(
          // padding: const EdgeInsets.symmetric(vertical: 20),
          child: Padding(
            padding: context.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(18),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF2D2D2D)
                            : const Color(0xFFF0F0F0),
                    radius: 18,
                    child: Icon(
                      LucideIcons.x,
                      size: 18,
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppColors.black,
                    ),
                  ),
                ),
                Gap(22),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/images/quiz_onboarding.png'),
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Gap(50),
                Text('PYQ QUIZ 2024', style: context.textTheme.headlineSmall),
                Gap(10),
                Text(
                  'Practice previous year questions and improve your problem solving skills.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
                Gap(16),
                PaperSelectionBox(),
                Gap(150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LucideIcons.bookOpen, size: 18),
                    const SizedBox(width: 6),
                    Text('100 questions', style: context.textTheme.bodyMedium),

                    const SizedBox(width: 16),

                    Icon(LucideIcons.clock, size: 18),
                    const SizedBox(width: 6),
                    Text('120 minutes', style: context.textTheme.bodyMedium),
                  ],
                ),
                Gap(10),
                CommonButton(
                  onPressed: () {
                    // To Quiz attempt screen
                    context.pushNamed(RouterConstants.quizAttemptRouteName);
                  },
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Test',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(LucideIcons.zap),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
