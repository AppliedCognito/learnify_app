import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/theme/colors/app_colors.dart';
import 'package:learnify_app/core/models/test_model.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CommonTestWidget extends StatelessWidget {
  final TestModel? test;
  final int totalQuestions;
  final int answeredQuestions;
  final bool highlight;

  const CommonTestWidget({
    super.key,
    this.test,
    this.totalQuestions = 10,
    this.answeredQuestions = 6,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    // Use test data if available, otherwise use provided values
    final title = test?.title ?? 'Math Fundamentals';
    final description =
        test?.description ?? 'Practice basic arithmetic and problem solving';

    // Calculate progress
    double progress =
        totalQuestions == 0 ? 0 : answeredQuestions / totalQuestions;

    return Container(
      padding: context.paddingM,
      width: context.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: highlight ? Color(0xffD5E8FF) : AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const Gap(6),
          Text(
            description,
            style: context.textTheme.labelMedium?.copyWith(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(16),
          Row(
            children: [
              const Icon(LucideIcons.bookOpen, size: 15),
              const Gap(6),
              Text(
                '$totalQuestions questions',
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const Gap(10),
          LinearProgressIndicator(
            value:
                progress == 0 ? 0 : progress, // Only progress is shown when > 0
            backgroundColor: Colors.grey.shade200,
            color:
                progress == 0
                    ? Colors.white
                    : Colors
                        .black, // Show gray when no progress, black when progress
            minHeight: 10,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
