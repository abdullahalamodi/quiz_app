import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/fixed_assets.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';
import 'package:quiz_app/features/layout/widgets/layout_app_par.dart';
import 'package:quiz_app/features/questions/pages/questions_page.dart';
import 'package:quiz_app/features/common_widgets/custom_animated_icon.dart';

class WrongAnswerPage extends StatelessWidget {
  const WrongAnswerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  FixedAssets.questionMark,
                  height: 200,
                  color: Colors.red,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'You choosed wrong answer 🙄,\nbut don\'t worry you can try again.',
                style: context.tthm.titleMedium!.copyWith(
                  height: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.replace(
                    builder: (_) => const QuestionsPage(),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: primaryColor,
                  ),
                  child: const Text('try again'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.blue,
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
}
