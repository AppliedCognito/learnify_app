import 'package:flutter/material.dart';
import 'colors/app_colors.dart';

class AppAppBarTheme {
  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    elevation: 2,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );

  static const AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: Color(0xFF1E1E1E),
    foregroundColor: Colors.white,
    elevation: 2,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );
}
