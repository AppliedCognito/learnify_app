import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/providers/database_provider.dart';
import 'package:learnify_app/presentation/widgets/common_test_widget.dart';

class ContinueSection extends ConsumerWidget {
  const ContinueSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final continueTests = ref.watch(continueTestsProvider);

    if (continueTests.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            'Continue',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Gap(10),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 34.0),
            child: Row(
              children:
                  continueTests.map((test) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                      ), // Spacing between items
                      child: SizedBox(
                        width:
                            MediaQuery.of(context).size.width *
                            0.6, // Control card width
                        child: CommonTestWidget(
                          test: test,
                          totalQuestions: test.totalQuestions,
                          answeredQuestions: test.answeredQuestions,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
