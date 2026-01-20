import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:learnify_app/core/constants/app_constants.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/routes/router_constants.dart';
import 'package:learnify_app/features/quiz/presentation/provider/quiz_provider.dart';
import 'package:learnify_app/presentation/widgets/common_appbar.dart';
import 'package:learnify_app/presentation/widgets/common_button.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../widgets/metric_card.dart';

class QuizCompleteScreen extends ConsumerWidget {
  final int correctAnswers;
  final int totalQuestions;
  final int timeTakenInSeconds;

  const QuizCompleteScreen({
    super.key,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.timeTakenInSeconds,
  });

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accuracy =
        totalQuestions > 0
            ? ((correctAnswers / totalQuestions) * 100).toInt()
            : 0;
    final xp = correctAnswers * 10; // 10 XP per correct answer

    return Scaffold(
      // backgroundColor: const Color(0xFFF6F6F6),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [const CommonAppbar()],
        body: SingleChildScrollView(
          child: Padding(
            padding: context.paddingHorizontalLarge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppConstants.defaultTopPadding),
                Text(
                  'Quiz\nCompleted',
                  textAlign: TextAlign.center,
                  style: context.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Gap(24),
                Image.asset('assets/images/quiz_complete.png', height: 160),
                Gap(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MetricCard(
                      title: 'Total XP',
                      icon: LucideIcons.zap,
                      value: '$xp',
                    ),
                    MetricCard(
                      title: 'Time',
                      icon: LucideIcons.clock,
                      value: _formatTime(timeTakenInSeconds),
                    ),
                    MetricCard(
                      title: 'Accuracy',
                      icon: LucideIcons.goal,
                      value: '$accuracy%',
                    ),
                  ],
                ),
                Gap(50),
                CommonButton(
                  backgroundColor: Colors.white,
                  widget: Text(
                    'Try Again',
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    // Reset quiz state (providers are autoDispose, so implicitly handled on disposal,
                    // but we are pushing replacement so previous screen is disposed)

                    // Navigate to QuizAttemptScreen
                    context.pushReplacementNamed(
                      RouterConstants.quizAttemptRouteName,
                    );
                  },
                ),
                const SizedBox(height: 8),
                CommonButton(
                  widget: Text(
                    'Continue',
                    style: context.textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    // Navigate back to home
                    context.goNamed(RouterConstants.homeRouteName);
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
