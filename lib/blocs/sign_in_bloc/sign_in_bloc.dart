import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:e_learning_app/blocs/sign_in_bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInDataState()) {
    on<SignInEmailEvent>((event, emit) {
      final currentState = state as SignInDataState;
      emit(currentState.copyWith(email: event.email));
    });
    on<SignInPasswordEvent>((event, emit) {
      final currentState = state as SignInDataState;
      emit(currentState.copyWith(password: event.password));
    });
    on<PasswordObscureEvent>((event, emit) {
      var currentState = (state as SignInDataState).obscureText;
      currentState = event.obscure;
      print('obscure $currentState');
      emit(SignInDataState(obscureText: currentState));
    });
  }


}
