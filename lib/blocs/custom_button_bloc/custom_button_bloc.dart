import 'package:e_learning_app/extensions/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'custom_button_event.dart';

part 'custom_button_state.dart';

class CustomButtonBloc extends Bloc<CustomButtonEvent, CustomButtonState> {
  CustomButtonBloc()
      : super(ButtonTitleChangeState(currentTitle: 'commonWords.next'.tr())) {
    on<ButtonTitleChangeEvent>((event, emit) {
      var stateFromEvent = (state as ButtonTitleChangeState).currentTitle;
      stateFromEvent = event.newTitle;
      emit(ButtonTitleChangeState(currentTitle: stateFromEvent));
    });
  }
}
