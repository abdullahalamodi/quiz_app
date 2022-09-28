import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/extentions/build_context_extentions.dart';
import 'package:quiz_app/features/common_widgets/error_widget.dart';
import 'package:quiz_app/features/layout/widgets/layout_app_par.dart';
import 'package:quiz_app/features/questions/pages/complete_page.dart';
import 'package:quiz_app/features/questions/pages/wrong_answer_page.dart';
import 'package:quiz_app/features/questions/providers/correct_answers_provider.dart';
import 'package:quiz_app/features/questions/providers/question_index_provider.dart';
import 'package:quiz_app/features/questions/providers/questions_provider.dart';
import 'package:quiz_app/features/questions/widgets/question_widget.dart';
import 'package:quiz_app/features/questions/widgets/timer_widget.dart';

class QuestionsPage extends ConsumerWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  onComplete(BuildContext context, WidgetRef ref) {
    // answer 0 questions
    ref.read(questionsProvider.notifier).setScore();
    context.replace(builder: (_) => const CompletePage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncQuestionsList = ref.watch(questionsProvider);
    ref.refresh(correctAnswersProvider);
    return Scaffold(
      appBar: const LayoutAppBar(),
      body: asyncQuestionsList.when(
        data: (data) => data.isEmpty
            ? Center(
                child: CustomErrorWidget(
                  onPressed: () => ref.refresh(questionsProvider),
                ),
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: context.h * 0.05,
                    child: Hero(
                      tag: 'intro',
                      child: TimerWidget(
                        duration: 2 * 60, //  2 minutes
                        onComplete: () => onComplete(context, ref),
                      ),
                    ),
                  ),
                  Positioned(
                    top: context.h * 0.26,
                    right: 20,
                    left: 20,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final index = ref.watch(currentQuestionIndexProvider);
                        return QuestionWidget(
                          questionModel: data[index],
                          currentQuestionText: '${index + 1} / ${data.length}',
                          onSelectAnswer: (correct) {
                            if (!correct) {
                              //wrong answer
                              context.replace(
                                  builder: (_) => const WrongAnswerPage());
                            } else {
                              ref
                                  .read(questionsProvider.notifier)
                                  .correctAnswer();
                              if (index >= data.length - 1) {
                                // answerd all questions correctly
                                onComplete(context, ref);
                              } else {
                                ref
                                    .read(questionsProvider.notifier)
                                    .nextQuestion();
                              }
                            }
                          },
                          onSkip: () {
                            if (index >= data.length - 1) {
                              // last question skiped
                              onComplete(context, ref);
                            } else {
                              ref
                                  .read(questionsProvider.notifier)
                                  .skipQuestion();
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
        error: (_) => CustomErrorWidget(
          onPressed: () => ref.refresh(questionsProvider),
        ),
        loading: () => const Center(
          child: Text('loading data ..'),
        ),
      ),
    );
  }
}
