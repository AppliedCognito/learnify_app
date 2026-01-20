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
                Container(
                  padding: context.paddingHorizontal,
                  decoration: BoxDecoration(
                    color: const Color(0xffFAFAFA),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        selectedPaper,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.keyboard_arrow_down),
                        onSelected: (value) {
                          ref.read(selectedPaperProvider.notifier).state =
                              value;
                        },
                        itemBuilder:
                            (BuildContext context) => [
                              const PopupMenuItem(
                                value: 'Paper I',
                                child: Text('Paper I'),
                              ),
                              const PopupMenuItem(
                                value: 'Paper II',
                                child: Text('Paper II'),
                              ),
                            ],
                      ),
                    ],
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
