import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gellary/core/usable_functions/api_service_helper.dart';
import 'package:gellary/core/usable_functions/validate_check.dart';
import 'package:gellary/core/utils/app_constants/app_constants.dart';
import 'package:gellary/core/utils/app_routes_utils/app_router.dart';
import 'package:gellary/features/login/data/models/user_model.dart';
import 'package:gellary/features/login/data/repository/login_interface.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    _emailController.dispose();
    _passwordController.dispose();
    return super.close();
  }

  //#region private variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginInterface _loginRepo;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  //#endregion

  //#region getters
  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  GlobalKey<FormState> get formKey => _formKey;

  FocusNode get emailFocusNode => _emailFocusNode;

  FocusNode get passwordFocusNode => _passwordFocusNode;

//#endregion

  //#region private methods

  Future<void> _saveUserToken(String token) async {
    await _loginRepo.sharedPreferences
        .setString(AppConstants.currentUserToken, token);
  }

  Future<void> _saveUserCurrentName(String name) async {
    await _loginRepo.sharedPreferences
        .setString(AppConstants.currentUserName, name);
  }

//#endregion

  //#region public methods
  Future<void> login(BuildContext context) async {
    if (ValidateCheck.validate(_formKey)) {
      emit(const LoginLoadingState());
      StackTrace stackTrace = StackTrace.current;
      ApiResponse apiResponse = await _loginRepo.login(
          stackTrace: stackTrace,
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      if (apiResponse.response?.statusCode != null &&
          apiResponse.response?.statusCode == 200 &&
          apiResponse.response!.data['error_message'] == null) {
        User user = User.fromJson(apiResponse.response!.data);
        await _saveUserToken(user.token);
        await _saveUserCurrentName(user.user.name);
        emit(const LoginSuccessfulState());
      } else {
        if (context.mounted) {
          ApiChecker.checkApi(apiResponse, context);
          emit(const LoginFailedState());
        }
      }
    }
  }

  void navigateToHomeScreen(BuildContext context) {
    AppNavigator.navigateToHomeScreen(context);
  }
//#endregion
}
