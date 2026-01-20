import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;

  const MetricCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final headerColor = isDark ? const Color(0xFF2D2D2D) : Colors.black;
    final borderColor = isDark ? Colors.grey.shade700 : Colors.black;
    final textColor = isDark ? Colors.white : Colors.black;

    return Container(
      width: 105,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Top Section
          Container(
            decoration: BoxDecoration(
              color: headerColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: isDark ? Colors.white70 : Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Bottom Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(icon, size: 24, color: textColor),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
