import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:learnify_app/core/theme/colors/app_colors.dart';
import 'package:learnify_app/core/providers/database_provider.dart';
import 'package:learnify_app/presentation/widgets/common_appbar.dart';
import 'package:learnify_app/features/pyq/presentation/widgets/pyq_card.dart';

class PreviousYearQuestionsScreen extends ConsumerWidget {
  const PreviousYearQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.onPrimary,
        body: NestedScrollView(
          headerSliverBuilder:
              (context, innerBoxIsScrolled) => [
                const CommonAppbar(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: context.paddingHorizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(16),
                        Text(
                          'Previous Year Questions',
                          style: context.textTheme.headlineSmall,
                        ),
                        const Gap(16),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search by title, year',
                                  hintStyle: context.textTheme.labelMedium
                                      ?.copyWith(color: AppColors.outline),
                                  isDense: true,
                                  contentPadding: context.paddingS,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: AppColors.outline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Gap(8),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: AppColors.outline),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.filter_alt_outlined,
                                  color: AppColors.outline,
                                  size: 20,
                                ),
                                onPressed: () {
                                  // Handle filter action
                                },
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        Container(
                          padding: context.paddingXS,
                          decoration: BoxDecoration(
                            color: context.colorScheme.surface,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                              color: context.colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            labelColor: context.colorScheme.onSurface,
                            unselectedLabelColor: context.colorScheme.onSurface,
                            labelStyle: context.textTheme.labelLarge,
                            labelPadding: EdgeInsets.zero,
                            tabs: const [
                              Tab(text: 'Paper I'),
                              Tab(text: 'Paper II'),
                            ],
                          ),
                        ),
                        const Gap(16),
                      ],
                    ),
                  ),
                ),
              ],
          body: TabBarView(
            children: [
              _buildGrid(context, ref, 'Paper I'),
              _buildGrid(context, ref, 'Paper II'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid(BuildContext context, WidgetRef ref, String paper) {
    final pyqTests = ref.watch(pyqByPaperProvider(paper));

    return Padding(
      padding: context.paddingHorizontal.add(const EdgeInsets.only(top: 16)),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: pyqTests.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) => PYQCard(test: pyqTests[index]),
      ),
    );
  }
}
