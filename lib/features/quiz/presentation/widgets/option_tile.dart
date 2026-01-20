import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import '../provider/quiz_provider.dart';

class OptionTile extends ConsumerWidget {
  final int optionIndex;
  final String optionText;
  final VoidCallback? onTap;

  const OptionTile({
    super.key,
    required this.optionIndex,
    required this.optionText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestionIndex = ref.watch(currentQuestionProvider);
    final answers = ref.watch(answersProvider);

    // Check if this option is selected for the current question
    final isSelected = answers[currentQuestionIndex] == optionIndex;

    return GestureDetector(
      onTap: () {
        // Update the answer for the current question
        final currentAnswers = Map<int, int>.from(ref.read(answersProvider));
        currentAnswers[currentQuestionIndex] = optionIndex;
        ref.read(answersProvider.notifier).state = currentAnswers;

        // Trigger the callback (e.g., for navigation)
        onTap?.call();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orangeAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                isSelected
                    ? Colors.orangeAccent
                    : (Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade700
                        : Colors.black),
          ),
        ),
        child: Text(optionText, style: context.textTheme.bodyLarge),
      ),
    );
  }
}
