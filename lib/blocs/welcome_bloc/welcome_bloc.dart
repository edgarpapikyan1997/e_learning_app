import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_event.dart';

part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeCurrentPage(currentIndex: 0)) {
    on<WelcomePageEventChanged>((event, emit) {
      emit(WelcomeCurrentPage(currentIndex: (state as WelcomeCurrentPage).currentIndex));
    });
  }
}
