import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInEmailEvent extends SignInEvent {
  final String email;

  const SignInEmailEvent(this.email);
}

class SignInPasswordEvent extends SignInEvent {
  final String password;

  const SignInPasswordEvent(this.password);
}

class PasswordObscureEvent extends SignInEvent {
  final bool obscure;

  const PasswordObscureEvent(this.obscure);
}

class SignInEmailError extends SignInEvent {
  final String? errorEmailText;

  const SignInEmailError({
    this.errorEmailText,
  });
}

class SignInPasswordError extends SignInEvent {
  final String? errorPasswordText;

  const SignInPasswordError({this.errorPasswordText});
}
