import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/auth/pages/login_page.dart';
import 'package:quiz_app/features/auth/providers/token_povider.dart';
import 'package:quiz_app/features/home/home_page.dart';
import 'package:quiz_app/theme/theme_colors.dart';

class IntroPage extends ConsumerWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validToken = ref.watch(fetchTokenProvider);
    return Scaffold(
      body: Hero(
        tag: 'intro',
        child: Container(
          color: primaryColor,
          width: double.infinity,
          child: Column(
            children: [
              // animated text
              //
              validToken.when(
                data: (data) => ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            data ? const HomePage() : const LoginPage(),
                        transitionDuration: const Duration(milliseconds: 600),
                      ),
                    );
                  },
                  child: const Text('start'),
                ),
                error: (_, __) => Column(
                  children: [
                    const Text('field load data.'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        ref.refresh(fetchTokenProvider);
                      },
                      child: const Text('try again'),
                    )
                  ],
                ),
                loading: () => const Text('loading data ...'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
