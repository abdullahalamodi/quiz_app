import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';
import 'package:quiz_app/models/user_model.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: primaryColor,
            ),
          ),
          child: Image.asset(
            FixedAssets.avatar,
            height: 26,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user?.name ?? 'Abdullah alamodi',
              style: context.tthm.titleLarge!.copyWith(
                height: 1.2,
              ),
            ),
            Text(
              user?.mobile ?? '+966 00000000',
              style: context.tthm.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
