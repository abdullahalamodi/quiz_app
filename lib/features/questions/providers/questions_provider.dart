import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/questions/providers/correct_answers_provider.dart';
import 'package:quiz_app/features/questions/providers/question_index_provider.dart';
import 'package:quiz_app/features/questions/providers/question_page_state.dart';
import 'package:quiz_app/features/questions/providers/skip_provider.dart';
import 'package:quiz_app/services/api_services.dart';
import 'package:quiz_app/services/shared_preferences_services.dart';

final questionsProvider =
    StateNotifierProvider<QuestiosPageProvider, QuestionsPageState>((ref) {
  return QuestiosPageProvider(ref);
});

class QuestiosPageProvider extends StateNotifier<QuestionsPageState> {
  QuestiosPageProvider(this.ref) : super(const QuestionsPageState.loading()) {
    getQuestionList();
  }
  final Ref ref;

  Future<void> getQuestionList() async {
    final services = ref.read(apiServicesProvider);
    final token = ref.read(sharedPreferencesProvider).getUserModel()!.token;

    final questions = await services.getQuestionsList(token: token!);
    state = QuestionsPageState.data(questions);
  }

  Future<void> setScore() async {
    final score = ref.read(currentQuestionIndexProvider);
    final services = ref.read(apiServicesProvider);
    final token = ref.read(sharedPreferencesProvider).getUserModel()!.token;
    await services.setUserScore(score: 600, token: token!);
  }

  Future<void> submetScore() async {}

  bool get canSkip => ref.read(skipProvider);

  void skipQuestion() {
    ref.read(skipProvider.notifier).state = false;
    nextQuestion();
  }

  void nextQuestion() {
    ref.read(currentQuestionIndexProvider.notifier).state++;
  }

  void correctAnswer() {
    ref.read(correctAnswersProvider.notifier).state++;
  }
}
