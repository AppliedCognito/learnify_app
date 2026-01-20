import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:learnify_app/core/extensions/context_extensions.dart';

class ScoreContainer extends StatelessWidget {
  final IconData icon;
  final String score;

  const ScoreContainer({super.key, required this.icon, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109,
      padding: context.paddingS,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 15, color: Colors.black),
          Gap(8),
          Text(score),
        ],
      ),
    );
  }
}
