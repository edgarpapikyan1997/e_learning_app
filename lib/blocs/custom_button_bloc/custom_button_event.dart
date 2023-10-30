part of 'custom_button_bloc.dart';

abstract class CustomButtonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class ButtonTitleChangeEvent extends CustomButtonEvent {
  final String newTitle;

  ButtonTitleChangeEvent({required this.newTitle});

  @override
  List<Object?> get props => [newTitle];
}


class ButtonPressedEvent extends CustomButtonEvent {
  final bool value;

  ButtonPressedEvent({this.value = false});
}

