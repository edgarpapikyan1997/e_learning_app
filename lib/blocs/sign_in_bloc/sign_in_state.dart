import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInDataState extends SignInState {
  final String email;
  final String password;
  final bool obscureText;

  const SignInDataState(
      {this.email = "", this.password = "", this.obscureText = false});

  SignInDataState copyWith({String? email, String? password,}) {
    return SignInDataState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [email, password, obscureText];
}
