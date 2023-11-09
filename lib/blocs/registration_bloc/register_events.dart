abstract class RegisterEvents {
  const RegisterEvents();
}

class UserNameEvent extends RegisterEvents {
  final String userName;

  const UserNameEvent({required this.userName});
}

class EmailEvent extends RegisterEvents {
  final String userEmail;

  const EmailEvent({required this.userEmail});
}

class PasswordEvent extends RegisterEvents {
  final String userPassword;

  const PasswordEvent({required this.userPassword});
}

class ConfirmPassEvent extends RegisterEvents {
  final String confirmPass;

  const ConfirmPassEvent({required this.confirmPass});
}

/// ERROR EVENTS

class UserNameError extends RegisterEvents {
  final String userNameError;

  const UserNameError({required this.userNameError});
}

class EmailError extends RegisterEvents {
  final String userEmailError;

  const EmailError({required this.userEmailError});
}

class PasswordError extends RegisterEvents {
  final String userPasswordError;

  const PasswordError({required this.userPasswordError});
}

class ConfirmPassError extends RegisterEvents {
  final String confirmPassError;

  const ConfirmPassError({required this.confirmPassError});
}
