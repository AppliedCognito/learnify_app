import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/theme/colors/app_colors.dart';
import 'package:learnify_app/core/models/test_model.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PYQCard extends StatelessWidget {
  final TestModel test;

  const PYQCard({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingS,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: context.screenHeight * 0.12,
                child: Image.asset(
                  'assets/images/start_test.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const Gap(12),
          Text(test.title, style: context.textTheme.titleSmall),
          const Gap(6),
          Text(
            test.description,
            style: context.textTheme.labelSmall?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(
                LucideIcons.bookOpen,
                size: 14,
                color: AppColors.onSurface,
              ),
              const Gap(4),
              Text(
                '${test.totalQuestions} Q.',
                style: context.textTheme.labelSmall,
              ),
              const Gap(12),
              const Icon(
                LucideIcons.clock,
                size: 14,
                color: AppColors.onSurface,
              ),
              const Gap(4),
              Text('${test.duration} m.', style: context.textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
