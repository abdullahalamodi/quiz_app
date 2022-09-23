import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/models/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.init() = Init;
  const factory AuthState.loading() = Loading;
  const factory AuthState.loggedin({required UserModel userModel}) = LoggedIn;
  const factory AuthState.nameAdd({required UserModel userModel}) = NameAdd;
  factory AuthState.error([String? message]) = Error;
}
