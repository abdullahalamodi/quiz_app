import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/models/my_score_model.dart';
import 'package:quiz_app/services/shared_preferences_services.dart';

final myScoresProvider =
    FutureProvider.autoDispose<List<MyScoreModel>>((ref) async {
  final scoresList = ref.read(sharedPreferencesProvider).getMyScores();
  return Future.value(scoresList.reversed.toList());
});
