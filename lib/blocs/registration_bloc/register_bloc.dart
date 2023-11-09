import 'package:e_learning_app/blocs/registration_bloc/register_events.dart';
import 'package:e_learning_app/blocs/registration_bloc/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UserNameEvent>((event, emit) {
      emit(state.copyWith(userName: event.userName));
      print('User Name: ${state.userName}');
    });
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.userEmail));
      print('User Email: ${state.email}');
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.userPassword));
      print('User Pass: ${state.password}');
    });
    on<ConfirmPassEvent>((event, emit) {
      emit(state.copyWith(confirm: event.confirmPass));
      print('User Confirm: ${state.confirm}');
    });

    ///ERROR EVENTS

    on<UserNameError>((event, emit) {
      emit(state.copyWith(confirm: event.userNameError));
      print('User Name Err: ${state.confirm}');
    });
    on<EmailError>((event, emit) {
      emit(state.copyWith(confirm: event.userEmailError));
      print('User Email Err: ${state.confirm}');
    });
    on<PasswordError>((event, emit) {
      emit(state.copyWith(confirm: event.userPasswordError));
      print('User Pass Err: ${state.confirm}');
    });
    on<ConfirmPassError>((event, emit) {
      emit(state.copyWith(confirm: event.confirmPassError));
      print('User Conf Err: ${state.confirm}');
    });
  }
}
