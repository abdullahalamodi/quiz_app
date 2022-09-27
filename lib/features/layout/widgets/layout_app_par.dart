import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';

class LayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LayoutAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            const Text('QuizU'),
            const SizedBox(width: 12),
            Image.asset(
              FixedAssets.questionMark,
              height: 30,
            ),
          ],
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(height: 1),
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
