import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/theme/colors/app_colors.dart';
import 'package:learnify_app/core/providers/database_provider.dart';
import 'package:learnify_app/features/home/presentation/providers/start_test_provider.dart';
import 'package:learnify_app/features/home/presentation/widgets/start_test_widget.dart';

class StartTestSection extends ConsumerWidget {
  const StartTestSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(startTestIndexProvider);
    final featuredTests = ref.watch(featuredTestsProvider);

    final List<Widget> cards =
        featuredTests.map((test) => StartTestWidget(test: test)).toList();

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: cards.length,
          itemBuilder: (context, index, realIndex) {
            return cards[index];
          },
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.38,
            viewportFraction: 1,
            padEnds: false,
            // autoPlay: true,
            // enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              ref.read(startTestIndexProvider.notifier).state = index;
            },
          ),
        ),
        Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(cards.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: currentIndex == index ? 8.0 : 6.0,
              height: currentIndex == index ? 8.0 : 6.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    currentIndex == index
                        ? AppColors.primary
                        : Color.fromRGBO(0, 0, 0, 0.3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
