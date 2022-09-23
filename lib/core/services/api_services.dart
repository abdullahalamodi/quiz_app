import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/core/models/user_model.dart';
import 'package:quiz_app/core/services/shared_preferences_services.dart';

final apiServicesProvider = Provider<ApiServices>((ref) {
  final sharedpref = ref.read(sharedPreferencesProvider);
  return ApiServices(sharedpref);
});

class ApiServices {
  ApiServices(this._sharedPref);
  final SharedPreferencesServces _sharedPref;

  Future<bool> getToken({
    required String token,
  }) async {
    final uri = Uri(scheme: 'https', host: _baseUrl, path: '/Token');
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final resposne = await http.get(uri, headers: headers);
    if (resposne.statusCode == 200 || resposne.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<UserModel?> login({
    required String mobile,
    required String otp,
  }) async {
    final uri = Uri(scheme: 'https', host: _baseUrl, path: '/Login');
    final body = {
      'OTP': otp,
      'mobile': mobile,
    };
    try {
      final resposne = await http.post(uri, body: body);
      if (resposne.statusCode == 200 || resposne.statusCode == 201) {
        final data = json.decode(resposne.body);
        final userModel = UserModel.fromJson(data);
        await _sharedPref.setUserModel(userModel);
        return userModel;
      }
      debugPrint(resposne.statusCode.toString());
      debugPrint(resposne.body);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<UserModel?> addName({
    required String name,
    required String token,
  }) async {
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final uri = Uri(scheme: 'https', host: _baseUrl, path: '/Name');
    final body = {
      'name': name,
    };
    try {
      final resposne = await http.post(uri, body: body, headers: headers);
      if (resposne.statusCode == 200 || resposne.statusCode == 201) {
        final data = json.decode(resposne.body);
        final userModel = UserModel.fromJson(data);
        await _sharedPref.setUserModel(userModel);
        return userModel;
      }
      debugPrint(resposne.statusCode.toString());
      debugPrint(resposne.body);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}

const _baseUrl = 'quizu.okoul.com';
