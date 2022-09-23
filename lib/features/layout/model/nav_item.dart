import 'package:flutter/material.dart';
import 'package:quiz_app/features/home/home_page.dart';
import 'package:quiz_app/features/profile/profile_page.dart';
import 'package:quiz_app/features/leaderboard/leaderboard_page.dart';

enum PagesNames {
  home,
  leaderboard,
  profile,
}

typedef PageTitle = String Function(BuildContext context)?;

class NavItem {
  NavItem({
    required this.pageName,
    required this.page,
    this.icon,
  });

  PagesNames pageName;
  Widget page;
  IconData? icon;

  static List<NavItem> navPages() => [
        NavItem(
          pageName: PagesNames.home,
          page: const HomePage(),
          icon: Icons.home,
        ),
        NavItem(
          pageName: PagesNames.leaderboard,
          page: const LeaderboardPage(),
          icon: Icons.leaderboard_rounded,
        ),
        NavItem(
          pageName: PagesNames.profile,
          page: const ProfilePage(),
          icon: Icons.person,
        ),
      ];

  NavItem getPage(BuildContext context, PagesNames name) =>
      navPages().firstWhere((element) => element.pageName == name);
}
