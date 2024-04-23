import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/core/components/custom_components/custom_loader.dart';
import 'package:gellary/core/components/custom_components/custom_snack_bar.dart';
import 'package:gellary/core/components/custom_components/custom_text_field.dart';
import 'package:gellary/core/usable_functions/validate_check.dart';
import 'package:gellary/core/utils/design_utils/app_sizes.dart';
import 'package:gellary/features/login/presentation/view_model_manger/login_cubit.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({super.key, required this.height, required this.width});

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.6),
          borderRadius: BorderRadius.circular(25)),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessfulState) {
            showCustomSnackBar('Logged In Successfully', context,isError: false);
            LoginCubit.get(context).navigateToHomeScreen(context);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Form(
            key: cubit.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'LOG IN',
                  style: TextStyle(
                      fontSize: AppSizes.fontSizeOverOverLarge,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.7)),
                ),
                CustomTextField(
                  labelText: 'User Name',
                  filled: true,
                  showLabelText: false,
                  borderRadius: 25,
                  controller: cubit.emailController,
                  focusNode: cubit.emailFocusNode,
                  validator: (value) =>
                      ValidateCheck.validateEmail(value, context),
                  onSubmit: (x) {
                    FocusScope.of(context)
                        .requestFocus(cubit.passwordFocusNode);
                  },
                ),
                CustomTextField(
                  labelText: 'Password',
                  filled: true,
                  showLabelText: false,
                  borderRadius: 25,
                  controller: cubit.passwordController,
                  focusNode: cubit.passwordFocusNode,
                  isPassword: true,
                  inputAction: TextInputAction.done,
                  validator: (value) =>
                      ValidateCheck.validatePassword(value, context),
                  onSubmit: (x) {
                    cubit.login(context);
                  },
                ),
                Visibility(
                  visible: state is LoginLoadingState,
                  replacement: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          backgroundColor: Colors.blue.withOpacity(.5),
                          minimumSize: const Size(282, 46)),
                      onPressed: () {
                        cubit.login(context);
                      },
                      child: const Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontSize: AppSizes.fontSizeOverLarge,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                  child: const CustomLoader(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
