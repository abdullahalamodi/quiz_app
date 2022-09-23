import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'leaderboard_model.freezed.dart';
part 'leaderboard_model.g.dart';

@freezed
class LeaderBoardModel with _$LeaderBoardModel {
  const LeaderBoardModel._();
  const factory LeaderBoardModel({
    required String name,
    required int score,
  }) = _LeaderBoardModel;

  factory LeaderBoardModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderBoardModelFromJson(json);

// some values grater than 30 and that is wrong.
  int get validScore => score > 30 ? 30 : score;

  // get precentage from 0 to 1 for chart
  double get scorePrecentage => validScore / 30;

  MaterialColor get color {
    if (validScore >= 25) {
      return Colors.green;
    } else if (validScore >= 20) {
      return Colors.yellow;
    } else if (validScore >= 15) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
