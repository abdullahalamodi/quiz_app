import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/models/user_model.dart';
import 'package:quiz_app/services/api_services.dart';
import 'package:quiz_app/services/shared_preferences_services.dart';

final profileProvider = FutureProvider.autoDispose<UserModel?>((ref) async {
  final services = ref.read(apiServicesProvider);
  final token = ref.read(sharedPreferencesProvider).getToken();
  return services.getUserInfo(token: token!);
});
