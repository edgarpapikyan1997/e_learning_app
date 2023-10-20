part of 'welcome_bloc.dart';

abstract class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => [];
}

class WelcomeCurrentPage extends WelcomeState {
  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
  const WelcomeCurrentPage({required this.currentIndex});

}
