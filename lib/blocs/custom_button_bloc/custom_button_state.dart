part of 'custom_button_bloc.dart';

abstract class CustomButtonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ButtonTitleChangeState extends CustomButtonState {
  final String currentTitle;

  ButtonTitleChangeState({required this.currentTitle});

  @override
  List<Object?> get props => [currentTitle];
}
