import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dot_indicator_event.dart';

part 'dot_indicator_state.dart';

class DotIndicatorBloc extends Bloc<DotIndicatorEvent, DotIndicatorState> {
  DotIndicatorBloc() : super(const DotCurrentIndex(dotCurrentIndex: 0)) {
    on<DotIndicatorEventChanged>((event, emit) {
      var stateFromEvent = (state as DotCurrentIndex).dotCurrentIndex;
      stateFromEvent = event.index;
      emit(DotCurrentIndex(
        dotCurrentIndex: stateFromEvent,
      ));
    });
  }
}
