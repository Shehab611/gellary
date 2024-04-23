part of 'login_interface.dart';

final class LoginRepoImpl implements LoginInterface {
  final DioClient _dioClient;
  final SharedPreferences _sharedPreferences;

  LoginRepoImpl(this._dioClient, this._sharedPreferences);

  @override
  Future<ApiResponse> login(
      {required String email,
      required String password,
      required StackTrace stackTrace}) async {
    try {
      Response response = await _dioClient.post(ApiEndPoints.login, stackTrace,
          data: {'email': email, 'password': password});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  SharedPreferences get sharedPreferences => _sharedPreferences;

  @override
  void updateToken() {
    _dioClient.updateToken();
  }
}
