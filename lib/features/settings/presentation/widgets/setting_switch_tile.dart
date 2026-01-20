import 'package:flutter/material.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';

class SettingSwitchTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingSwitchTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        title,
        style: context.textTheme.titleLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        // style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: context.textTheme.titleMedium?.copyWith(
          fontSize: 12,
          // color: Colors.grey,
        ),
        // style: const TextStyle(fontSize: 12)
      ),
      value: value,
      onChanged: onChanged,
      activeThumbColor: Colors.deepPurple,
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      // elevation: 4,
      decoration: BoxDecoration(
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(16),
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  // style: const TextStyle(
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}
