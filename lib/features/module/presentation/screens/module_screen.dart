import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/constants/app_constants.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/features/module/presentation/providers/click_provider.dart';
import 'package:learnify_app/features/module/presentation/widgets/module_expansion.dart';

class ModuleScreen extends ConsumerWidget {
  const ModuleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPaper = ref.watch(selectedPaperProvider);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(AppConstants.defaultTopPadding),
          Padding(
            padding: context.paddingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Modules',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(90),
                GestureDetector(
                  onTap:
                      () => _showPaperSwitchBottomSheet(
                        context,
                        ref,
                        selectedPaper,
                      ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffFAFAFA),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          selectedPaper,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Gap(8),
                        const Icon(Icons.keyboard_arrow_down, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return ModuleExpansion(index: index, paper: selectedPaper);
              },
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }
}

void _showPaperSwitchBottomSheet(
  BuildContext context,
  WidgetRef ref,
  String currentPaper,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder:
        (context) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Switch Paper',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              _PaperOption(
                title: 'Paper I',
                isSelected: currentPaper == 'Paper I',
                onTap: () {
                  ref.read(selectedPaperProvider.notifier).state = 'Paper I';
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 12),
              _PaperOption(
                title: 'Paper II',
                isSelected: currentPaper == 'Paper II',
                onTap: () {
                  ref.read(selectedPaperProvider.notifier).state = 'Paper II';
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
  );
}

class _PaperOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaperOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Theme.of(context).primaryColor.withOpacity(0.05)
                  : Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border:
              isSelected
                  ? Border.all(color: Theme.of(context).primaryColor)
                  : Border.all(color: Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color:
                    isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.black87,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.radio_button_checked,
                color: Theme.of(context).primaryColor,
              )
            else
              const Icon(Icons.radio_button_unchecked, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
