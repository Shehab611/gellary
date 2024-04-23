import 'package:dio/dio.dart';
import 'package:gellary/core/usable_functions/api_service_helper.dart';
import 'package:gellary/core/utils/app_constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_impl.dart';

abstract interface class HomeInterface {
  final SharedPreferences sharedPreferences;

  HomeInterface(this.sharedPreferences);

  Future<void> logout();

  Future<ApiResponse> getImages({required StackTrace stackTrace});

  Future<ApiResponse> uploadImage(
      {required dynamic data,
      required StackTrace stackTrace,
      String? contentType});
}
