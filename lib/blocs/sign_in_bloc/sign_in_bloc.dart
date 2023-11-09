import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_learning_app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:e_learning_app/blocs/sign_in_bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInDataState()) {
    on<SignInEmailEvent>((event, emit) {
      final currentState = state as SignInDataState;
      emit(currentState.copyWith(
        email: event.email,
      ));
    });
    on<SignInPasswordEvent>((event, emit) {
      final currentState = state as SignInDataState;
      emit(currentState.copyWith(
        password: event.password,
      ));
    });
    on<PasswordObscureEvent>((event, emit) {
      var currentState = (state as SignInDataState).obscureText;
      currentState = event.obscure;
      emit(SignInDataState(obscureText: currentState));
    });

    on<SignInEmailPasswordError>((event, emit) {
      final currentState = state as SignInDataState;

      emit(currentState.copyWith(
        errorEmail: event.emailError,
        errorPassword: event.passwordError,
      ));
    });

    on<SignInEmailError>((event, emit) {
      String? errorState = (state as SignInDataState).errorEmail;
      errorState = event.errorEmailText;
      print(errorState);
      emit(SignInDataState(errorEmail: errorState ?? ''));
    });

    on<SignInPasswordError>((event, emit) {
      String? errorState = (state as SignInDataState).errorPassword;
      errorState = event.errorPasswordText;
      print(errorState);
      emit(SignInDataState(errorPassword: errorState ?? ''));
    });
  }
}
