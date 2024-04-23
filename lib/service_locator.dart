import 'package:dio/dio.dart';
import 'package:gellary/core/usable_functions/api_service_helper.dart';
import 'package:gellary/features/home/data/repository/home_interface.dart';
import 'package:gellary/features/login/data/repository/login_interface.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<DioClient>(() => DioClient(
      ApiEndPoints.baseUrl, sl.get(),
      loggingInterceptor: sl.get(), sharedPreferences: sl.get()));

  sl.registerLazySingleton<LoginInterface>(
      () => LoginRepoImpl(sl.get(), sl.get()));

  sl.registerLazySingleton<HomeInterface>(
      () => HomeRepoImpl(sl.get(), sl.get()));
}
