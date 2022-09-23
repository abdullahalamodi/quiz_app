import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';
import 'package:quiz_app/features/auth/pages/login_page.dart';
import 'package:quiz_app/features/auth/providers/token_povider.dart';
import 'package:quiz_app/features/common_widgets/error_widget.dart';
import 'package:quiz_app/features/layout/layout_landing.dart';

class IntroPage extends ConsumerWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validToken = ref.watch(fetchTokenProvider);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: kPagePadding,
              color: primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Spacer(),
                  Text(
                    'Welecom to QuizU \nwe are happy to join us, \nlets have some fun.',
                    style: context.tthm.titleLarge!.copyWith(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: validToken.when(
              data: (data) => ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) =>
                          data ? const LayoutLanding() : const LoginPage(),
                      transitionDuration: const Duration(milliseconds: 600),
                    ),
                  );
                },
                child: const Text('start'),
              ),
              error: (_, __) => Center(
                child: CustomErrorWidget(
                  onPressed: () {
                    ref.refresh(fetchTokenProvider);
                  },
                ),
              ),
              loading: () => Center(
                  child: Text(
                'loading data ...',
                style: context.tthm.bodyMedium!.copyWith(),
              )),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
