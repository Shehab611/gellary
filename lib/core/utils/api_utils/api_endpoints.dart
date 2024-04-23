part of '../../usable_functions/api_service_helper.dart';

abstract final class ApiEndPoints {
  //#region Private variables can not be accessed

  static const String _host = 'https://flutter.prominaagency.com';
  static const String _api = '$_host//api/';
  static const String _login = 'auth/login';
  static const String _upload = 'upload';
  static const String _gallery = 'my-gallery';

  //#endregion

  //#region Getters to use them in the app
  ///Api base url

  static String get baseUrl => _api;

  static String get login => _login;

  static String get upload => _upload;

  static String get gallery => _gallery;

//#endregion
}
