import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/features/home/presentation/view/home_screen.dart';
import 'package:gellary/features/home/presentation/view_model_manger/home_cubit.dart';
import 'package:gellary/features/login/presentation/view_model_manger/login_cubit.dart';
import 'package:gellary/features/login/presentation/views/login_screen.dart';
import 'package:gellary/service_locator.dart';

part 'app_navigator.dart';

part 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kLoginScreen: (BuildContext context) =>
        BlocProvider(
          create: (context) => LoginCubit(sl.get()),
          child: const LoginScreen(),
        ),
    AppPathName.kHomeScreen: (BuildContext context) =>
        BlocProvider(
          create: (context) => HomeCubit(sl.get())..getImages(context),
          child: const HomeScreen(),
        ),
  };
}
