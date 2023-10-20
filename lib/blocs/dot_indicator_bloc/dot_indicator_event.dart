part of 'dot_indicator_bloc.dart';

abstract class DotIndicatorEvent extends Equatable {
  const DotIndicatorEvent();

  @override
  List<Object?> get props => [];
}

class DotIndicatorEventChanged extends DotIndicatorEvent {
  final int index;

   const DotIndicatorEventChanged({required this.index});

  @override
  List<Object?> get props => [index];


}
