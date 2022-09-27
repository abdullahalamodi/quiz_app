import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/features/layout/widgets/layout_app_par.dart';
import 'package:quiz_app/features/questions/providers/correct_answers_provider.dart';
import 'package:quiz_app/features/questions/widgets/question_animated_icon.dart';

class CompletePage extends ConsumerWidget {
  const CompletePage({Key? key}) : super(key: key);

  share() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const LayoutAppBar(),
      body: Padding(
        padding: kPagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'intro',
              child: CustomAnimatedIcon(
                child: Transform.rotate(
                  angle: -pi / 12.0,
                  child: Image.asset(
                    FixedAssets.trophy,
                    height: 200,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Text(
                    _getTitile(ref.read(correctAnswersProvider)),
                    style: context.tthm.titleLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 22,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    'You have compeleted',
                    style: context.tthm.titleLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ' ${ref.read(correctAnswersProvider)} ',
                      style: context.tthm.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Text(
                    'correct answers',
                    style: context.tthm.titleLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => share(),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                  ),
                  child: const Text('share'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.amber,
                  ),
                  child: const Text('back to home'),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  String _getTitile(int score) {
    if (score == 30) {
      return 'the champion 🥇';
    } else if (score > 25) {
      return 'excellent work 🏅';
    } else if (score > 15) {
      return 'you did it, you win 🥈';
    } else {
      return 'you need more practice 💡';
    }
  }
}
