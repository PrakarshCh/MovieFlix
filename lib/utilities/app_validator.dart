import 'package:flutter/material.dart';
import 'package:ttn_flix/constants/app_string_constant.dart';

class Validator {
  static bool isEmpty(String? value) {
    return value?.isEmpty ?? true;
  }

  static String? isEmailValid(BuildContext context, {String? email}) {
    var emailRegExp = RegExp("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}\\@"
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
        "("
        "\\."
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
        ")+");
    if (isEmpty(email)) {
      return AppStrings.emailIsRequired;
    } else if (!emailRegExp.hasMatch(email ?? '')) {
      return AppStrings.enterValidEmail;
    }
    return null;
  }

  static String? isValidPassword(BuildContext context, {String? password}) {
    if (isEmpty(password)) {
      return AppStrings.passwordIsRequired;
    } else if ((password?.trim().length ?? 0) < 8) {
      return AppStrings.validPassword;
    }
    return null;
  }

  static String? isValidMessage(BuildContext context, {String? message}) {
    if (isEmpty(message ?? '')) {
      return AppStrings.messageRequired;
    }
    return null;
  }

  static String? isValidName(BuildContext context, {String? name}) {
    var nameRegexp = RegExp(r"^[a-zA-Z]+$");
    if (isEmpty(name)) {
      return AppStrings.nameRequired;
    } else if (!nameRegexp.hasMatch(name ?? '')) {
      return AppStrings.validName;
    }
    return null;
  }
}
