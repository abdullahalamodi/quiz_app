import 'package:quiz_app/models/question_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'question_page_state.freezed.dart';

@freezed
class QuestionsPageState with _$QuestionsPageState {
  const factory QuestionsPageState.loading() = _Loading;
  const factory QuestionsPageState.data(List<QuestionModel> questions) = _Data;
  const factory QuestionsPageState.error([String? message]) = _Error;
}
