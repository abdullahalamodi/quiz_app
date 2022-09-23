import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/phone_number.dart' as intl;
import 'package:phone_number/phone_number.dart';
import 'package:quiz_app/services/api_services.dart';
import 'package:quiz_app/services/shared_preferences_services.dart';
import 'package:quiz_app/features/auth/providers/auth_state.dart';

final authProvider =
    StateNotifierProvider.autoDispose<AuthProvider, AuthState>((ref) {
  final apiServices = ref.read(apiServicesProvider);
  return AuthProvider(apiServices, ref: ref);
});

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider(this._apiServices, {required this.ref})
      : super(const AuthState.init());

  final Ref ref;
  final ApiServices _apiServices;
  final phoneNumberUtil = PhoneNumberUtil();
  late final loginFormKey = GlobalKey<FormState>();
  late final addNameFormKey = GlobalKey<FormState>();
  late final nameController = TextEditingController();
  late final pinController = TextEditingController();
  intl.PhoneNumber? phoneNumber;

  Future<void> login(String mobiel, String otp) async {
    state = const AuthState.loading();
    final resposne = await _apiServices.login(
      mobile: mobiel,
      otp: otp,
    );
    if (resposne != null) {
      state = AuthState.loggedin(userModel: resposne);
    } else {
      state = AuthState.error();
    }

    log(resposne.toString());
  }

  Future<void> addName(String name) async {
    state = const AuthState.loading();
    final token = ref.read(sharedPreferencesProvider).getUserModel()?.token;
    final resposne = await _apiServices.addName(
      name: name,
      token: token!,
    );
    if (resposne != null) {
      state = AuthState.nameAdd(userModel: resposne);
    } else {
      state = AuthState.error();
    }
  }

  Future<bool> validatePhone() async {
    if (phoneNumber == null) return false;
    return await phoneNumberUtil.validate(
      phoneNumber!.number,
      regionCode: phoneNumber?.countryISOCode,
    );
  }
}
