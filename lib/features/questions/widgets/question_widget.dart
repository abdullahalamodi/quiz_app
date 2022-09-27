import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/core/theme/theme_colors.dart';
import 'package:quiz_app/features/questions/providers/skip_provider.dart';
import 'package:quiz_app/models/question_model.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.questionModel,
    required this.onSelectAnswer,
    required this.onSkip,
  }) : super(key: key);

  final QuestionModel questionModel;
  final Function(bool correct) onSelectAnswer;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: Text(
            questionModel.question,
            style: context.tthm.titleLarge!.copyWith(
              height: 1.2,
            ),
          ),
        ),
        Column(
          children: [
            ...questionModel.answersMap.keys.map(
              (key) => Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  // border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(kRadius),
                  color: primaryColor.withOpacity(.1),
                ),
                child: Column(
                  children: [
                    if (key == questionModel.correct) const Text('data'),
                    _answerRow(
                      context,
                      char: key,
                      text: questionModel.answersMap[key]!,
                      onTap: () => onSelectAnswer(key == questionModel.correct),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Consumer(
              builder: (context, ref, child) {
                final canSkip = ref.watch(skipProvider);

                return canSkip
                    ? ElevatedButton(
                        onPressed: onSkip,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.green,
                          minimumSize: const Size(100, 40),
                        ),
                        child: const Text('skip'),
                      )
                    : const SizedBox.shrink();
              },
            )
          ],
        ),
      ],
    );
  }

  Widget _answerRow(
    BuildContext context, {
    required String char,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: primaryColor,
                ),
                shape: BoxShape.circle,
              ),
              child: Text(char),
            ),
            const SizedBox(width: 12),
            Text(text),
          ],
        ),
      ),
    );
  }
}
