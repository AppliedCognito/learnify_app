import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/providers/database_provider.dart';
import 'package:learnify_app/features/module/presentation/providers/click_provider.dart';
import 'package:learnify_app/features/module/presentation/widgets/expansion_content.dart';

class ModuleExpansion extends ConsumerWidget {
  final int index;
  final String paper;

  const ModuleExpansion({super.key, required this.index, required this.paper});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expansionMap = ref.watch(moduleExpansionProvider);
    final isExpanded = expansionMap[index] ?? false;

    // Get modules for the selected paper
    final modules = ref.watch(modulesByPaperProvider(paper));

    // Get the module for this index
    final module = index < modules.length ? modules[index] : null;

    if (module == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.paddingHorizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Module ${(index + 1).toString().padLeft(2, '0')}',
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(moduleExpansionProvider.notifier).toggle(index);
                },
                icon: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ),
            ],
          ),
        ),
        if (isExpanded) ExpansionContent(moduleId: module.id),
        Gap(15),
      ],
    );
  }
}
