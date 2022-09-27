import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/services/api_services.dart';
import 'package:quiz_app/services/shared_preferences_services.dart';

final validateTokenProvider = FutureProvider.autoDispose<bool>((ref) async {
  final apiServices = ref.read(apiServicesProvider);
  final sharedPref = ref.read(sharedPreferencesProvider);
  final token = sharedPref.getToken();
  if (token == null) return false;
  final response = await apiServices.getToken(token: token);
  return response;
});
