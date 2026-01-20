import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/constants/app_constants.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';

import '../widgets/account_section.dart';
import '../widgets/appearance_section.dart';
import '../widgets/language_section.dart';
import '../widgets/notification_section.dart';
import '../widgets/setting_title_section.dart';
import '../widgets/support_section.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: context.paddingHorizontal,
        children: [
          Gap(AppConstants.defaultTopPadding),
          SettingTitleSection(),
          Gap(20),
          const NotificationsSection(),
          Gap(20),
          const AppearanceSection(),
          Gap(20),
          const LanguageSection(),
          Gap(20),
          const SupportSection(),
          Gap(20),
          const AccountSection(),
          Gap(20),
          Center(
            child: Column(
              children: [
                Text(
                  'Learnify v1.0.0',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  // style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Gap(4),
                Text(
                  '© 2025 AppliedCognito',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  // style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Gap(20),
        ],
      ),
    );
  }
}
