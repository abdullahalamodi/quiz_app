import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_score_model.freezed.dart';
part 'my_score_model.g.dart';

@freezed
class MyScoreModel with _$MyScoreModel {
  const factory MyScoreModel({
    required String date,
    required double score,
  }) = _MyScoreModel;

  factory MyScoreModel.fromJson(Map<String, dynamic> json) =>
      _$MyScoreModelFromJson(json);
}
