import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_score_model.freezed.dart';
part 'my_score_model.g.dart';

@freezed
class MyScoreModel with _$MyScoreModel {
  const MyScoreModel._();
  const factory MyScoreModel({
    required String date,
    required int score,
  }) = _MyScoreModel;
  factory MyScoreModel.fromScore({
    required int score,
  }) =>
      MyScoreModel(
        date: DateTime.now().toIso8601String(),
        score: score,
      );

  factory MyScoreModel.fromJson(Map<String, dynamic> json) =>
      _$MyScoreModelFromJson(json);

  double get scorePrecentage => score / 30;

  Color get color {
    if (score >= 25) {
      return Colors.green;
    } else if (score >= 20) {
      return Colors.amber;
    } else if (score >= 15) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

// I just don't want to use package, so made this
  String get formatedDate {
    final dateTime = DateTime.parse(date);
    final year = dateTime.year;
    final month = dateTime.month;
    final day = dateTime.day;
    final h = dateTime.hour;
    final m = dateTime.minute;
    final time = dateTime.hour > 12 ? '${h - 12}:$m pm' : '$h:$m am';
    return '$year/$month/$day   $time';
  }
}
