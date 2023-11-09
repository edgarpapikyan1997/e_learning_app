import 'package:e_learning_app/extensions/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../../blocs/sign_in_bloc/sign_in_event.dart';

class SignInController {
  final BuildContext context;
  final String emailAddress;
  final String password;

  const SignInController({
    required this.emailAddress,
    required this.password,
    required this.context,
  });

  Future<void> handleSignIn() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (userCredential.user != null) {
        routing(true);
        print('Signed In to account $emailAddress');
      }else {
        routing(false);
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == "user-not-found") {
        provideIssue("user-not-found");
        print('No user found for that email');
      }
      if (e.code.toString() == "wrong-password") {
        provideIssue("wrong-password");
        print('Wrong password provided');
      }
      if (e.code.toString() == "invalid-email") {
        print('Your email format is wrong');
      }
    }
  }

  void routing(bool move) {
    move ? context.go('/homePage') : context.pop();
  }

  void provideIssue(String errorType) {
    if (errorType == "wrong-password") {
      BlocProvider.of<SignInBloc>(context).add(SignInPasswordError(
          errorPasswordText: 'signInLogIn.incorrectPassFill'.tr()));
    }
    if (errorType == "invalid-email") {
      BlocProvider.of<SignInBloc>(context).add(SignInEmailError(
          errorEmailText: 'signInLogIn.incorrectEmailFill'.tr()));
    }
    if (errorType == "user-not-found") {
      BlocProvider.of<SignInBloc>(context).add(
          SignInEmailError(errorEmailText: 'signInLogIn.userNotFound'.tr()));
    }
  }
}
