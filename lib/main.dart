import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gellary/core/utils/app_constants/app_constants.dart';
import 'package:gellary/core/utils/app_routes_utils/app_router.dart';
import 'package:gellary/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  await initServicesLocator();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final bool goHome =
      sl<SharedPreferences>().getString(AppConstants.currentUserToken) != null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gellary App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
      initialRoute:goHome ? AppPathName.kHomeScreen : AppPathName.kLoginScreen,
    );
  }
}
