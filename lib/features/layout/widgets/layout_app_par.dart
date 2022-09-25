import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';

class LayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LayoutAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          children: [
            const Text('QuizU'),
            const SizedBox(width: 12),
            SvgPicture.asset(
              FixedAssets.qMark,
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
