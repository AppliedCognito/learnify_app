import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnify_app/core/providers/theme_provider.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'setting_switch_tile.dart';

class AppearanceSection extends ConsumerWidget {
  const AppearanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return SectionCard(
      title: 'Appearance',
      icon: isDarkMode ? LucideIcons.moon : LucideIcons.sun,
      children: [
        SettingSwitchTile(
          title: 'Dark Mode',
          subtitle: 'Use dark theme',
          value: isDarkMode,
          onChanged: (val) {
            ref.read(themeProvider.notifier).toggleTheme();
          },
        ),
      ],
    );
  }
}
