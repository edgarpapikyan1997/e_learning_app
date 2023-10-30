import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}



class SignInDataState extends SignInState {
  final String email;
  final String password;
  final String errorEmail;
  final String errorPassword;
  final bool obscureText;

  const SignInDataState({
    this.email = "",
    this.password = "",
    this.errorEmail = "",
    this.errorPassword = "",
    this.obscureText = false,
  });

  SignInDataState copyWith({
    String? email,
    String? password,
    String? errorEmail,
    String? errorPassword,
    bool? obscureText,
  }) {
    return SignInDataState(
        email: email ?? this.email,
        password: password ?? this.password,
        errorEmail: errorEmail ?? this.errorEmail,
        errorPassword: errorPassword ?? this.errorPassword,
        obscureText: obscureText ?? this.obscureText);
  }

  @override
  List<Object> get props => [email, password, obscureText];
}
