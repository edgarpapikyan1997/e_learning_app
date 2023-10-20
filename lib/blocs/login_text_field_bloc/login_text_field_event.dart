
part of 'login_text_field_bloc.dart';

abstract class LoginTextFieldEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TextFieldSelectionEvent extends LoginTextFieldEvent {}

class TextFieldPasswordObscureEvent extends LoginTextFieldEvent{}
