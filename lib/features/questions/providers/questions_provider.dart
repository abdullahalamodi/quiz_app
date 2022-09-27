import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/features/questions/providers/correct_answers_provider.dart';
import 'package:quiz_app/features/questions/providers/question_index_provider.dart';
import 'package:quiz_app/features/questions/providers/question_page_state.dart';
import 'package:quiz_app/features/questions/providers/skip_provider.dart';
import 'package:quiz_app/models/my_score_model.dart';
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
    final token = ref.read(sharedPreferencesProvider).getToken();

    final questions = await services.getQuestionsList(token: token!);
    state = QuestionsPageState.data(questions);
  }

  Future<void> setScore() async {
    final score = ref.read(correctAnswersProvider);
    final services = ref.read(apiServicesProvider);
    final pref = ref.read(sharedPreferencesProvider);
    final token = pref.getToken();
    await services.setUserScore(score: score, token: token!);
    await pref.addScore(
      MyScoreModel.fromScore(score: score),
    );
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
