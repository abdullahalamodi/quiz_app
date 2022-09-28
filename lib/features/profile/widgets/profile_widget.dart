// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';
import 'package:quiz_app/features/auth/pages/login_page.dart';
import 'package:quiz_app/features/common_widgets/show_alert_dialog.dart';
import 'package:quiz_app/features/layout/provider/layout_provider.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/services/shared_preferences_services.dart';

class ProfileWidget extends ConsumerWidget {
  const ProfileWidget({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserModel? user;

  void removeToken(BuildContext context, WidgetRef ref) async {
    final logout = await showAlertDialog(
      context,
      title: 'logout',
      content: 'Are you sure you want to logout?',
      defaultActionText: 'logout',
      cancelActionText: 'cancel',
    );

    if (logout ?? false) {
      await ref.read(sharedPreferencesProvider).removeToken();
      await ref.read(sharedPreferencesProvider).removeMobile();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
      ref.refresh(layoutProvider);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        const Spacer(),
        GestureDetector(
          onTap: () => removeToken(context, ref),
          child: const Icon(
            Icons.logout,
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
