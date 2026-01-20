import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SettingTitleSection extends StatelessWidget {
  const SettingTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            radius: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                LucideIcons.chevronLeft,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          Gap(12),
          Text(
            "Settings",
            style: context.textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
