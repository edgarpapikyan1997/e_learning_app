part of 'login_text_field_bloc.dart';

abstract class LoginTextFieldState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TextFieldPasswordObscureState extends LoginTextFieldState {}

class TextFieldSelectionState extends LoginTextFieldState {}

