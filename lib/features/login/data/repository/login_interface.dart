import 'package:dio/dio.dart';
import 'package:gellary/core/usable_functions/api_service_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_impl.dart';

abstract interface class LoginInterface {
  final SharedPreferences sharedPreferences;

  LoginInterface(this.sharedPreferences);

  Future<ApiResponse> login(
      {required String email,
      required String password,
      required StackTrace stackTrace});

  void updateToken();
}
