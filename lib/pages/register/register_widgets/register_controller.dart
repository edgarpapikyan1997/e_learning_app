import 'package:e_learning_app/blocs/registration_bloc/register_bloc.dart';
import 'package:e_learning_app/blocs/registration_bloc/register_events.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class RegisterController {
  final BuildContext context;
  final String userName;
  final String email;
  final String password;
  final String confirm;

  const RegisterController({
    required this.context,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirm,
  });

  void handleEmailRegister() async {
    if (userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirm.isEmpty) {
      if (userName.isEmpty) {
        provideIssue('signInLogIn.emptyName'.tr());
        pop(false);
        return;
      }
      if (email.isEmpty) {
        provideIssue('invalid-email');
        pop(false);
        return;
      }
      if (password.isEmpty) {
        provideIssue('signInLogIn.atLeastSix'.tr());
        pop(false);
        return;
      }
      if (confirm.isEmpty) {
        provideIssue('signInLogIn.doConfirm'.tr());
        pop(false);
        return;
      }
      pop(false);
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        print(
            'An email was sent to your registered email.\nTo activate your account please check your emailBox');
        pop(false);
        Fluttertoast.showToast(
          msg:
              '${'signInLogIn.checkEmail'.tr()},\n${'signInLogIn.goTroughLink'.tr()},\n ${'signInLogIn.afterLogIn'.tr()}',
          fontSize: 15,
          gravity: ToastGravity.TOP,
        );
        await Future.delayed(
          const Duration(seconds: 3),
        );
        pop(true);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        provideIssue('weak-password');
        pop(false);
        print('Provided password is too weak');
      } else if (e.code == "email-already-in-use") {
        provideIssue("email-already-in-use");
        pop(false);
        print('Provided email already used');
      } else if (e.code == "invalid-email") {
        provideIssue("invalid-email");
        pop(false);
        print('Provided email is not valid');
      }
    }
  }

  void pop(bool? go) {
    if (go == true) {
      context.go('/signIn');
    } else {
      context.pop();
    }
  }

  void provideIssue(String errorType) {
    if (errorType == 'signInLogIn.emptyName'.tr()) {
      BlocProvider.of<RegisterBloc>(context)
          .add((UserNameError(userNameError: 'signInLogIn.emptyName'.tr())));
      return;
    }
    if (errorType == "email-already-in-use") {
      BlocProvider.of<RegisterBloc>(context)
          .add((EmailError(userEmailError: 'signInLogIn.emailInUse'.tr())));
      return;
    }
    if (errorType == "invalid-email") {
      BlocProvider.of<RegisterBloc>(context).add(((EmailError(
          userEmailError: 'signInLogIn.incorrectEmailFill'.tr()))));
      return;
    }
    if (errorType == "operation-not-allowed") {
      BlocProvider.of<RegisterBloc>(context)
          .add(((EmailError(userEmailError: 'signInLogIn.notAllowed'.tr()))));
    }
    if (errorType == "weak-password") {
      BlocProvider.of<RegisterBloc>(context)
          .add((PasswordError(userPasswordError: 'signInLogIn.weakPass'.tr())));
    }
    if (errorType == "weak-password") {
      BlocProvider.of<RegisterBloc>(context)
          .add((PasswordError(userPasswordError: 'signInLogIn.weakPass'.tr())));
    }
  }
}
