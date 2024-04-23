part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}

final class HomeGetDataLoading extends HomeState {
  const HomeGetDataLoading();

  @override
  List<Object> get props => [];
}

final class HomeGetDataSuccessful extends HomeState {
  const HomeGetDataSuccessful(this.response);

  final GalleryResponse response;

  @override
  List<Object> get props => [];
}

final class HomeGetDataFailed extends HomeState {
  const HomeGetDataFailed();

  @override
  List<Object> get props => [];
}
