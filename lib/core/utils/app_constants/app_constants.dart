abstract final class AppConstants {
  //#region private variables
  static const Duration _connectionTimeOut = Duration(seconds: 30000);

  //#region private shared preferences keys
  static const String _currentUserToken = 'currentUserToken';

  static const String _currentUsername = 'currentUserName';

  //#endregion

  //#endregion

  //#region getters
  static Duration get connectionTimeOut => _connectionTimeOut;

  //#region shared preferences keys getters
  static String get currentUserToken => _currentUserToken;

  static String get currentUserName => _currentUsername;
//#endregion
//#endregion
}
