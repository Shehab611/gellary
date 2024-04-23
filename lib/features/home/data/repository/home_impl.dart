part of 'home_interface.dart';

final class HomeRepoImpl implements HomeInterface {
  final DioClient _dioClient;
  final SharedPreferences _sharedPreferences;

  HomeRepoImpl(this._dioClient, this._sharedPreferences);

  @override
  SharedPreferences get sharedPreferences => _sharedPreferences;

  @override
  Future<ApiResponse> getImages({required StackTrace stackTrace}) async {
    try {
      Response response = await _dioClient.get(
        ApiEndPoints.gallery,
        stackTrace,
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  @override
  Future<void> logout() async {
    await _sharedPreferences.remove(AppConstants.currentUserToken);
    await _sharedPreferences.remove(AppConstants.currentUserName);
  }

  @override
  Future<ApiResponse> uploadImage(
      {required dynamic data,
      required StackTrace stackTrace,
      String?contentType}) async {
    try {
      Response response =
          await _dioClient.post(ApiEndPoints.upload, stackTrace, data: data,options:Options(
            contentType: contentType
          ) );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
