import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferencesServces>((ref) {
  throw UnimplementedError();
});

class SharedPreferencesServces {
  SharedPreferencesServces(this.prefs);
  final SharedPreferences prefs;

  // Future<bool> setUserModel(UserModel userModel) async {
  //   return await prefs.setString(
  //     kUserModel,
  //     json.encode(userModel.toJson()),
  //   );
  // }

  // UserModel? getUserModel() {
  //   final rawData = prefs.getString(kUserModel);
  //   if (rawData == null) return null;
  //   return UserModel.fromJson(json.decode(rawData));
  // }

  Future<bool> setToken(String token) async {
    return await prefs.setString(kToken, token);
  }

  String? getToken() {
    final token = prefs.getString(kToken);
    return token;
  }
}
