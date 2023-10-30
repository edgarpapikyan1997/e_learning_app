part of 'custom_button_bloc.dart';

class CustomButtonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ButtonTitleChangeState extends CustomButtonState {
  final String currentTitle;

  ButtonTitleChangeState({required this.currentTitle});

  @override
  List<Object?> get props => [currentTitle];
}

class ButtonPressedState extends CustomButtonState {
  final bool press;

  ButtonPressedState({this.press = false});

  @override
  List<Object?> get props => [press];
}
