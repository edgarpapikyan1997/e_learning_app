part of 'dot_indicator_bloc.dart';

abstract class DotIndicatorState extends Equatable {
  const DotIndicatorState();

  @override
  List<Object> get props => [];
}

class DotCurrentIndex extends DotIndicatorState {
  final int dotCurrentIndex;

  @override
  List<Object> get props => [dotCurrentIndex];
  const DotCurrentIndex({required this.dotCurrentIndex});
}
