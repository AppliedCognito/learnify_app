import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:learnify_app/core/routes/router_constants.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CommonAppbar extends StatelessWidget {
  const CommonAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      // expandedHeight: 160,
      floating: false,
      // pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
        title: const Text(
          'Learnify',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        background: SafeArea(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _statPill(
                    icon: LucideIcons.trophy,
                    value: '5',
                    color: const Color(0xFF7758FF),
                  ),
                  const Gap(8),
                  _statPill(
                    icon: LucideIcons.flame,
                    value: '56',
                    color: const Color(0xFFFF8484),
                  ),
                  const Gap(8),
                  _statPill(
                    icon: LucideIcons.zap,
                    value: '1250',
                    color: const Color(0xFFFF6CFD),
                  ),
                  const Gap(12),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(RouterConstants.profileRouteName);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        LucideIcons.user,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _statPill({
    required IconData icon,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 12, color: color),
          const Gap(4),
          Text(
            value,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
