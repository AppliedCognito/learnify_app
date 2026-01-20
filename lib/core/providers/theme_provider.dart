import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider for managing theme mode (light/dark)
class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light) {
    _loadThemeMode();
  }

  static const String _themeModeKey = 'theme_mode';

  /// Load saved theme mode from shared preferences
  Future<void> _loadThemeMode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool(_themeModeKey) ?? false;
      state = isDark ? ThemeMode.dark : ThemeMode.light;
    } catch (e) {
      // If loading fails, default to light mode
      state = ThemeMode.light;
    }
  }

  /// Toggle between light and dark mode
  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    state = newMode;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeModeKey, newMode == ThemeMode.dark);
    } catch (e) {
      // Handle error silently
    }
  }

  /// Set theme mode explicitly
  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeModeKey, mode == ThemeMode.dark);
    } catch (e) {
      // Handle error silently
    }
  }

  /// Check if dark mode is enabled
  bool get isDarkMode => state == ThemeMode.dark;
}

/// Provider instance for theme management
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});
