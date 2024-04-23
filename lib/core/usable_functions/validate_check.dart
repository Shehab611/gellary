import 'package:flutter/material.dart';
import 'package:gellary/core/utils/app_constants/app_strings.dart';

abstract final class ValidateCheck {
  static bool validate(GlobalKey<FormState> formKey) {
    return formKey.currentState!.validate();
  }

  static String? validateEmail(
    String? value,
    BuildContext context,
  ) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final kEmailValid = RegExp(pattern);
    bool isValid = kEmailValid.hasMatch(value.toString());
    if (value!.isEmpty) {
      return AppStrings.requiredEmail;
    } else if (isValid == false) {
      return
        AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validateEmptyText(
      String? value, BuildContext context, String? message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? validatePassword(
    String? value,
    BuildContext context,
  ) {
    if (value == null || value.isEmpty) {
      return AppStrings.requiredPassword;
    } else if (value.length < 8) {
      return AppStrings.invalidPassword;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? value, BuildContext context, String? password) {
    if (value == null || value.isEmpty) {
      return
        AppStrings.requiredConfirmPassword;
    } else if (value != password) {
      return
        AppStrings.invalidConfirmPassword;
    }
    return null;
  }
}
