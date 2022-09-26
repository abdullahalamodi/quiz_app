// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const QuestionModel._();
  const factory QuestionModel({
    @JsonKey(name: 'Question') required String question,
    required String a,
    required String b,
    required String c,
    required String d,
    required String correct,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, String> get answersMap => {
        'a': a,
        'b': b,
        'c': c,
        'd': d,
      };
}
