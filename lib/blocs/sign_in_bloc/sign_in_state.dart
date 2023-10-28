import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInErrorState extends SignInState {
  final String errorEmail;
  final String errorPassword;

  const SignInErrorState({
    this.errorEmail = '',
    this.errorPassword = '',
  });

  SignInErrorState copyWith({
    String? errorEmail,
    String? errorPassword,
  }) {
    return SignInErrorState(
      errorEmail: errorEmail ?? this.errorEmail,
      errorPassword: errorPassword ?? this.errorPassword
    );
  }
}

class SignInDataState extends SignInState {
  final String email;
  final String password;
  final String emailPreviousState;
  final String passwordPreviousState;
  final bool obscureText;

  const SignInDataState({
    this.email = "",
    this.password = "",
    this.emailPreviousState = "",
    this.passwordPreviousState = "",
    this.obscureText = false,
  });

  SignInDataState copyWith({
    String? email,
    String? password,
    bool? obscureText,
  }) {
    return SignInDataState(
        email: email ?? this.email,
        password: password ?? this.password,
        obscureText: obscureText ?? this.obscureText);
  }

  @override
  List<Object> get props => [email, password, obscureText];
}
