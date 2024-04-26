part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading;

  bool get isLoading => this == HomeStatus.loading;
}

class HomeState extends Equatable {
  const HomeState({required this.status, this.tabIndex = 0});

  const HomeState.initial()
      : status = HomeStatus.initial,
        tabIndex = 0;

  final HomeStatus status;
  final int tabIndex;

  HomeState copyWith({HomeStatus? status, int? tabIndex}) {
    return HomeState(
      status: status ?? this.status,
      tabIndex: tabIndex ?? this.tabIndex,
    );
  }

  @override
  List<Object> get props => [status, tabIndex];
}
