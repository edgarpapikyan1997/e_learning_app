
class RegisterStates {
  final String userName;
  final String email;
  final String password;
  final String confirm;

  final String nameError;
  final String emailError;
  final String passError;
  final String confirmError;

  const RegisterStates({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.confirm = "",
    this.nameError = "",
    this.emailError = "",
    this.passError = "",
    this.confirmError = "",
  });

  RegisterStates copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirm,
    String? nameError,
    String? emailError,
    String? passError,
    String? confirmError,
  }) {
    return RegisterStates(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirm: confirm ?? this.confirm,
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      passError: passError ?? this.passError,
      confirmError: confirmError ?? this.confirmError,
    );
  }
}
