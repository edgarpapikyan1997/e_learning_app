import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

String? validateName(String? userName) {
  const pattern = '^[a-zA-Z0-9]';
  final regex = RegExp(pattern);
  return userName!.isEmpty || !regex.hasMatch(userName)
      ? 'signInLogIn.emptyName'.tr()
      : null;
}

String? validateEmail(String? email) {
  const pattern = r'^.+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$';
  final regex = RegExp(pattern);
  return email!.isEmpty || !regex.hasMatch(email)
      ? 'signInLogIn.incorrectEmailFill'.tr()
      : null;
}

String? validatePassword(String? password) {
  return password!.isEmpty || password.length < 5
      ? 'signInLogIn.incorrectPassFill'.tr()
      : null;
}
