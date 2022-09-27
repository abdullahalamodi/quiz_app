import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/core/constants/k_constants.dart';
import 'package:quiz_app/models/my_score_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferencesServces>((ref) {
  throw UnimplementedError();
});

class SharedPreferencesServces {
  SharedPreferencesServces(this.prefs);
  final SharedPreferences prefs;

  Future<bool> setMobile(String mobile) async {
    return await prefs.setString(kMobile, mobile);
  }

  String getMobile() {
    final mobile = prefs.getString(kMobile);
    return mobile!;
  }

  Future<bool> setToken(String token) async {
    return await prefs.setString(kToken, token);
  }

  Future<bool> removeMobile() async {
    return await prefs.remove(kMobile);
  }

  Future<bool> removeToken() async {
    return await prefs.remove(kToken);
  }

  String? getToken() {
    final token = prefs.getString(kToken);
    return token;
  }

// use mobile for store score to display every account score
  List<MyScoreModel> getMyScores() {
    final myScoreKey = getMobile();
    final rawJson = prefs.getString(myScoreKey);
    if (rawJson == null) return [];
    final data = json.decode(rawJson);
    final myScoresList =
        List<MyScoreModel>.from(data.map((e) => MyScoreModel.fromJson(e)));
    return myScoresList;
  }

  Future<bool> addScore(MyScoreModel score) async {
    final myScoreKey = getMobile();
    final myScoresList = getMyScores();
    myScoresList.add(score);
    final data = myScoresList.map((e) => e.toJson()).toList();
    final rawJson = json.encode(data);
    return await prefs.setString(myScoreKey, rawJson);
  }
}
