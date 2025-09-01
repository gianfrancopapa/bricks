part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeTabChanged extends HomeEvent {
  const HomeTabChanged(this.tabIndex);

  final int tabIndex;

  @override
  List<Object> get props => [tabIndex];
}
