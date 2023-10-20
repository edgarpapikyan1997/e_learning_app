import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_text_field_event.dart';

part 'login_text_field_state.dart';

class LoginTextFieldBloc
    extends Bloc<LoginTextFieldEvent, LoginTextFieldState> {
  LoginTextFieldBloc() : super(TextFieldPasswordObscureState()) {
    on<TextFieldPasswordObscureEvent>((event, emit) {
      emit(TextFieldPasswordObscureState());
    });
    on<TextFieldSelectionEvent>((event, emit) {
      emit(TextFieldSelectionState());
    });
  }
}
