import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/models/leaderboard_model.dart';
import 'package:quiz_app/services/api_services.dart';
import 'package:quiz_app/services/shared_preferences_services.dart';

final leaderboardProvider = FutureProvider<List<LeaderBoardModel>>((ref) async {
  final services = ref.read(apiServicesProvider);
  final token = ref.read(sharedPreferencesProvider).getToken();
  return services.getLeaderboardData(token: token!);
});

final leaderboardItemIndexProvider = Provider.autoDispose<int>((ref) {
  throw UnimplementedError();
});

final leaderboardItemProvider =
    Provider.autoDispose.family<LeaderBoardModel, int>((ref, index) {
  return ref.read(leaderboardProvider).value![index];
});
