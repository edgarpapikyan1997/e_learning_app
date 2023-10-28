import 'package:e_learning_app/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:e_learning_app/extensions/extensions.dart';
import 'package:e_learning_app/pages/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/sign_in_bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;
  final String emailAddress;
  final String password;

  const SignInController({
    required this.emailAddress,
    required this.password,
    required this.context,
  });

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "signInLogIn.email".tr()) {
        // final state = BlocProvider.of<SignInBloc>(context).state;
        // String emailAddress = (state as SignInDataState).email;
        // String password = state.password;
        if (emailAddress.isEmpty) {
          print('email empty');
        } else {
          print('email is $emailAddress');
        }
        if (password.isEmpty) {
          print('password empty');
        } else {
          print('password is $password');
        }
        try {
         final credential =  await FirebaseAuth.instance
              .signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          print('Signed In to account $emailAddress');
          await Future.delayed(Duration(milliseconds: 3),);
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => HomePage()),
         );          // if (credential.user == null) {
          //   print('User does not exist');
          // }
          // if (!credential.user!.emailVerified) {
          //   print('Not verified');
          // }
          // if (credential.user != null) {
          //   print('User exist');
          // } else {
          //   print('No user');
          // }
        } on FirebaseAuthException catch (e) {
          print(e.code);
          if (e.code == "user-not-found") {
            print('No user found for that email');
          }
          if (e.code.toString() == " wrong-password ") {
            print('Wrong password provided');
          }
          if (e.code.toString() == "invalid-email") {
            print('Your email format is wrong');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
