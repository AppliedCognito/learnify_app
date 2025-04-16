import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnify_app/features/home/presentation/screens/home_screen.dart';

import 'bottom_nav_controller.dart';
import 'bottom_nav_widget.dart';

class BottomNavScaffold extends ConsumerWidget {
  const BottomNavScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    final pages = [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: const BottomNavWidget(),
    );
  }
}
