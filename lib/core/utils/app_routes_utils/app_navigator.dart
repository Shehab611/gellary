part of 'app_router.dart';

abstract final class AppNavigator {
  static navigateToLoginScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kLoginScreen,
      );

  static navigateToHomeScreen(BuildContext context) =>
      Navigator.popAndPushNamed(
        context,
        AppPathName.kHomeScreen,
      );

}
