import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/auth/providers/token_povider.dart';
import 'package:quiz_app/features/intro/intro_page.dart';

class QuizApp extends ConsumerWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(fetchTokenProvider);
    return const MaterialApp(
      home: IntroPage(),
    );
  }
}
